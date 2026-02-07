// direct , super=> supper call all the parents a and x,y in z(bar)
// use to calling parent function
//SPDX-License-Identifier:MIT
pragma solidity^0.8.10;
contract a{
    event log(string message);
    function foo() public virtual {
        emit log("a.foo");
    }
    function bar() public virtual{
        emit log("a.bar");
    }
}
contract x is a{
    function foo() virtual override public{
        emit log("x.foo");
a.foo();
    }
    function bar()virtual override public{
        emit log("x.bar");
        super.bar();
    }
}
contract y is a{
     function foo() virtual override public{
        emit log("yfoo");
a.foo();
    }
    function bar()virtual override public{
        emit  log("y.bar");
        super.bar();
    }
}
contract z is x,y{
    function foo()override(x,y) public{
        x.foo();
    }
    function bar() override(x,y)public{
        
        super.bar();
    }
}