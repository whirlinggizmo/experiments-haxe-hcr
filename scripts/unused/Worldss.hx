class World extends Script {

    public function onInit() {
        log("World.onInit");
        log ('app = ${app}');
    }

    public function onLoad() {
        log("World.onLoad");
        log ('app = ${app}');
    }

    public function onUnload() {
        log("World.onUnload");
    }

    public function onReload() {
        log("World.onReload");
        log ('app = ${app}');
        log('ctx = ${ctx}');
    }
}