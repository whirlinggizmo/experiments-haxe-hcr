import h3d.Vector;

class Basic extends Script {

    var foo = 0;

    override public function onLoad() {
        log("Basic.onLoad");
       // log ('app = ${app}');
        //log('ctx = ${ctx}');
        var clickStart:Vector = new Vector();
        log (clickStart);

    }

    override public function onUnload() {
        log("Basic.onUnload");
       // log ('app = ${app}');
        //log('ctx = ${ctx}');
        foo += 1;
        ctx.foo = foo;
    }

    override public function onReload() {
        log("Basic.onReload");
        //log ('app = ${app}');
        //log('ctx = ${ctx}');
        foo = ctx.foo;
        log (foo);
    }
}