import AstalBattery from "gi://AstalBattery"
import {Variable, bind} from "astal"
import {PowerlineLeft} from "./Powerline";

export default function Battery() {
    const battery = AstalBattery.get_default()

    let icon = Variable.derive(
        [
            bind(battery, "percentage"),
            bind(battery, "charging")
        ], (percentage, charging) => {
            if (charging) return "󰂄"
            else if (percentage > 0.9) return "󰂂"
            else if (percentage > 0.8) return "󰂁"
            else if (percentage > 0.7) return "󰂀"
            else if (percentage > 0.6) return "󰁿"
            else if (percentage > 0.5) return "󰁾"
            else if (percentage > 0.4) return "󰁽"
            else if (percentage > 0.3) return "󰁼"
            else if (percentage > 0.2) return "󰁻"
            else if (percentage > 0.1) return "󰁺"
            else if (percentage > 0.0) return "󰂎"
            else return "󰂃"
        }
    );

    return <box name={"Battery"}>
        <PowerlineLeft/>
        <box className={"widget"}>
            <label label={bind(icon)}/>
            <label label={bind(battery, "percentage").as(p => `${Math.floor(p * 100)}%`)}/>
        </box>
    </box>;
}
