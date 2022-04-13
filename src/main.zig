const std = @import("std");
const glfw = @import("glfw");

pub fn main() !void {
    try glfw.init(.{});
    defer glfw.terminate();

    const window = try glfw.Window.create(640, 480, "hello, mach", null, null, .{});
    defer window.destroy();

    while (!window.shouldClose()) {
        try glfw.pollEvents();
    }
}
