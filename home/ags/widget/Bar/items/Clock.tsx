import {GLib, Variable} from "astal";
import BarButton from "../BarButton";

export default () => {
    const format = "%a %b %-d, %-I:%M %p";
    const time = Variable<string>("").poll(
        1000,
        () => GLib.DateTime.new_now_local().format(format)!,
    );
    return (
        <BarButton
            onClicked={() => {}}
        >
            <label
                className="Time"
                onDestroy={() => time.drop()}
                label={time()}
            />
        </BarButton>
    );
};
