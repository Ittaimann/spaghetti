const std = @import("std");
const glfw = @import("glfw");
const vk = @import("vulkan.zig");

pub fn main() !void {
    try glfw.init(.{});
    defer glfw.terminate();
    const window = try glfw.Window.create(640, 480, "hello, mach", null, null, .{});
    defer window.destroy();

    std.log.info("vulkan supported {i}?", .{glfw.vulkanSupported()});

    try vk.initVulkan();
    // interesting note is that you can't defer a try... so do I have to handle stuff inside the cleanup?

    while (!window.shouldClose()) {
        try glfw.pollEvents();
    }
    try vk.cleanupVulkan();
}
