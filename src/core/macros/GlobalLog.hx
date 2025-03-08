package core.macros;

import haxe.macro.Context;
import haxe.macro.Expr;

class GlobalLog {
    public static macro function injectGlobalLog(): Void {
        // Define the `Log` type
        Context.defineType({
            name: "Log",
            pack: [],
            pos: Context.currentPos(),
            kind: TDClass(),
            fields: [
                {
                    name: "call",
                    kind: FFun({
                        args: [{ name: "message", type: macro :String }],
                        expr: Context.parse('core.logging.Logger.log(message)', Context.currentPos()),
                        ret: macro :Void
                    }),
                    access: [Access.APublic],
                    pos: Context.currentPos()
                },
                {
                    name: "debug",
                    kind: FFun({
                        args: [{ name: "message", type: macro :String }],
                        expr: Context.parse('core.logging.Logger.debug(message)', Context.currentPos()),
                        ret: macro :Void
                    }),
                    access: [Access.APublic, Access.AStatic],
                    pos: Context.currentPos()
                }
            ]
        });

        // Define a global module `GlobalLog` exposing `Log`
        Context.defineType({
            name: "GlobalLog",
            pack: [],
            pos: Context.currentPos(),
            kind: TDClass(),
            fields: [
                {
                    name: "Log",
                    kind: FVar(
                        macro : Dynamic,
                        Context.parse('{
                            call: function(message: String) { core.logging.Logger.log(message); },
                            debug: function(message: String) { core.logging.Logger.debug(message); }
                        }', Context.currentPos())
                    ),
                    access: [Access.APublic, Access.AStatic],
                    pos: Context.currentPos()
                }
            ]
        });
    }
}
