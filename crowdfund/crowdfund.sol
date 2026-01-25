// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract CrowdfundProject {

    
    uint256 public constant PLATFORM_FEE_BPS = 200; // 2%

     address public immutable owner;


    enum CampaignStatus {
        ACTIVE,
        SUCCESS,
        FAILED
    }
    struct Campaign {
        address creator;
        uint256 goal;
        uint256 raised;
        uint256 deadline;
        CampaignStatus status;
        address[] contributors;
    }
    uint256 public campaignCount;

    mapping(uint256 => Campaign) internal campaigns;

  
    mapping(uint256 => mapping(address => uint256)) internal contributions;

    event PlatformInitialized(address indexed owner);
    event CampaignCreated(uint256 indexed campaignId, address indexed creator);
    event ContributionReceived(uint256 indexed campaignId, address indexed contributor, uint256 amount);
    event CampaignResolved(uint256 indexed campaignId, CampaignStatus status);
    event FundsWithdrawn(uint256 indexed campaignId, address indexed creator, uint256 amount);
    event RefundIssued(uint256 indexed campaignId, address indexed contributor, uint256 amount);

   
    error NotOwner();
    error NotCreator();
    error CampaignNotActive();
    error CampaignNotFailed();
    error CampaignNotSuccessful();
    error DeadlineNotReached();
    error ZeroValue();

    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    modifier onlyCreator(uint256 campaignId) {
        if (msg.sender != campaigns[campaignId].creator) revert NotCreator();
        _;
    }

    modifier campaignActive(uint256 campaignId) {
        if (campaigns[campaignId].status != CampaignStatus.ACTIVE)
            revert CampaignNotActive();
        _;
    }

  

    constructor() {
        owner = msg.sender;
        emit PlatformInitialized(owner);
    }

       function createCampaign(uint256 goal, uint256 duration)
        external
        returns (uint256 campaignId)
    {
        if (goal == 0) revert ZeroValue();

        campaignId = ++campaignCount;

        Campaign storage c = campaigns[campaignId];
        c.creator = msg.sender;
        c.goal = goal;
        c.deadline = block.timestamp + duration;
        c.status = CampaignStatus.ACTIVE;

        emit CampaignCreated(campaignId, msg.sender);
    }

       function contribute(uint256 campaignId)external payable    campaignActive(campaignId){
        
        if (msg.value == 0) revert ZeroValue();

        Campaign storage c = campaigns[campaignId];

               if (contributions[campaignId][msg.sender] == 0) {
            c.contributors.push(msg.sender);
        }

        contributions[campaignId][msg.sender] += msg.value;
        c.raised += msg.value;

        emit ContributionReceived(campaignId, msg.sender, msg.value);
    }

        function resolveCampaign(uint256 campaignId)
        external
        onlyCreator(campaignId)
        campaignActive(campaignId)
    {
        Campaign storage c = campaigns[campaignId];

        if (block.timestamp < c.deadline) revert DeadlineNotReached();

        if (c.raised >= c.goal) {
            c.status = CampaignStatus.SUCCESS;
        } else {
            c.status = CampaignStatus.FAILED;
        }

        emit CampaignResolved(campaignId, c.status);
    }

   
    function withdrawFunds(uint256 campaignId)
        external
        onlyCreator(campaignId)
    {
        Campaign storage c = campaigns[campaignId];

        if (c.status != CampaignStatus.SUCCESS)
            revert CampaignNotSuccessful();

        uint256 fee = (c.raised * PLATFORM_FEE_BPS) / 10_000;
        uint256 payout = c.raised - fee;

        c.raised = 0; // state update BEFORE transfer

        (bool ok, ) = c.creator.call{value: payout}("");
        require(ok, "ETH transfer failed");

        emit FundsWithdrawn(campaignId, c.creator, payout);
    }

      function claimRefund(uint256 campaignId) external {
        Campaign storage c = campaigns[campaignId];

        if (c.status != CampaignStatus.FAILED)
            revert CampaignNotFailed();

        uint256 amount = contributions[campaignId][msg.sender];
        if (amount == 0) revert ZeroValue();

        contributions[campaignId][msg.sender] = 0;

        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "Refund failed");

        emit RefundIssued(campaignId, msg.sender, amount);
    }

    function getCampaign(uint256 campaignId)
        external
        view
        returns (
            address creator,
            uint256 goal,
            uint256 raised,
            uint256 deadline,
            CampaignStatus status
        )
    {
        Campaign storage c = campaigns[campaignId];
        return (c.creator, c.goal, c.raised, c.deadline, c.status);
    }

    receive() external payable {}
}
