import {App, Gdk, Gtk} from "astal/gtk3"
import style from "./style/main.scss"
import Bar from "./widget/Bar"
import AppLauncher from "./widget/AppLauncher";
import {monitorColorsChange, monitorDashboard, toggleWindow} from "./lib/utils";
import ScreenRecordService from "./service/ScreenRecord";
import Notifications from "./widget/Notifications";
import ControlCenter from "./widget/ControlCenter";
import Scrim from "./widget/Scrims/Scrim";
import Powermenu from "./widget/Powermenu";
import Verification from "./widget/Powermenu/Verification";

App.start({
    css: style,
    main() {
        const bars = new Map<Gdk.Monitor, Gtk.Widget>()

        Notifications()
        ControlCenter()
        AppLauncher()
        Scrim({ scrimType: "opaque", className: "scrim" });
        Scrim({ scrimType: "transparent", className: "transparent-scrim" });
        Verification()
        Powermenu()

        for (const gdkMonitor of App.get_monitors()) {
            bars.set(gdkMonitor, Bar(gdkMonitor))
        }


        App.connect("monitor-added", (_, gdkmonitor) => {
            bars.set(gdkmonitor, Bar(gdkmonitor));
        });

        App.connect("monitor-removed", (_, gdkmonitor) => {
            bars.get(gdkmonitor)?.destroy();
            bars.delete(gdkmonitor);
        });

        monitorColorsChange()
        monitorDashboard()
    },
    requestHandler(request: string, res: (response: any) => void) {
        const args = request.split(" ");
        if (args[0] == "toggle") {
            toggleWindow(args[1]);
            res("ok");
        } else if (args[0] == "record") {
            if (args[1] == "start") {
                ScreenRecordService.start();
                res("Record started");
            } else if (args[1] == "stop") {
                ScreenRecordService.stop();
                res("Record stopped");
            }
            return res("unknown command");
        } else {
            res("unknown command");
        }
    },
})