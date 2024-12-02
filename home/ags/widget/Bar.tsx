import {App, Astal, Gtk, Gdk} from "astal/gtk3"
import {Variable, GLib, bind} from "astal"
import Battery from "./modules/Battery"
import {PowerlineLeft, PowerlineLeftInverse} from "./modules/Powerline";

const time = Variable<string>("").poll(1000, () =>
    GLib.DateTime.new_now_local().format("%I:%M|%A %e")!)

export default function Bar(monitor: Gdk.Monitor) {
    return <window
        className="Bar"
        gdkmonitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
        application={App}
    >
        <centerbox>
            <box hexpand={true} halign={Gtk.Align.START}>
            </box>
            <box>

            </box>
            <box hexpand={true} halign={Gtk.Align.END}>
                <box name={"Clock"}>
                    <PowerlineLeft/>
                    <box className={"widget"}>
                        <label label={time().as(t => t.split('|')[0])}/>
                    </box>
                </box>

                <Battery/>

                <box name={"Icon"}>
                    <PowerlineLeftInverse/>
                    <box className={"widget"}>
                        <label label={"\ue843"}></label>
                    </box>
                </box>
            </box>
        </centerbox>
    </window>
}
