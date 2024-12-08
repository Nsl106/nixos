import AstalHyprland from "gi://AstalHyprland"
import {Variable, GLib, bind} from "astal"
import {PowerlineLeft, PowerlineRight} from "./Powerline";

export default function Workspaces() {
    const hyprland = AstalHyprland.get_default()

    return <box name={"Workspaces"}>
        <PowerlineLeft/>
        {bind(hyprland, "workspaces").as(workspaces =>
            workspaces
                .sort((a, b) => a.id - b.id)
                .map(workspace =>
                    <button
                        className={bind(hyprland, "focusedWorkspace").as(focused => workspace === focused ? "focused" : "")}
                        onClicked={() => {if (workspace !== hyprland.get_focused_workspace()) {workspace.focus()}}}

                        label={workspace.id.toString()}>

                    </button>
                )
        )}
        {/*  //      workspaces*/}
        {/*    // .map(workspace => {*/}
        {/*    // <button*/}
        {/*    //     className={bind(hyprland, "focusedWorkspace").as(focused => workspace === focused ? "focused" : "")}*/}
        {/*    //     onClicked={() => workspace.focus()}*/}
        {/*    // >*/}
        {/*    //     {workspace.id}*/}
        {/*    // </button>*/}
        {/*    // })*/}
        <PowerlineRight/>
    </box>;
}