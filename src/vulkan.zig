const std = @import("std");
const vk = @cImport({
    @cInclude("Include/vulkan/vulkan.h");
});
const glfw = @import("glfw");

//there should only be one of these so... just gonna deal with it as is
var instance: vk.VkInstance = undefined;

fn checkSuccess(result: vk.VkResult) !void {
    switch (result) {
        vk.VK_SUCCESS => {},
        else => return error.Unexpected,
    }
}

pub fn initVulkan() !void {
    const appInfo = vk.VkApplicationInfo{
        .sType = vk.VK_STRUCTURE_TYPE_APPLICATION_INFO,
        .pNext = null,
        .pApplicationName = "spaghetti engine",
        .applicationVersion = 0,
        .pEngineName = "spaghetti engine",
        .engineVersion = 0,
        .apiVersion = 0,
    };

    const createInfo = vk.VkInstanceCreateInfo{ .sType = vk.VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO, .pNext = null, .flags = 0, .pApplicationInfo = &appInfo, .enabledLayerCount = 0, .ppEnabledLayerNames = null, .enabledExtensionCount = 0, .ppEnabledExtensionNames = null };

    try checkSuccess(vk.vkCreateInstance(&createInfo, null, &instance));
    std.log.info("vulkan instance create", .{});
}
pub fn cleanupVulkan() !void {
    vk.vkDestroyInstance(instance, null);
    std.log.info("vulkan instance destroyed", .{});
}
