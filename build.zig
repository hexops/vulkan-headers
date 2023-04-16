const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "vulkan-headers",
        .root_source_file = .{ .path = "stub.c" },
        .target = target,
        .optimize = optimize,
    });

    inline for (.{ "vk_video", "vulkan" }) |subdir| {
        lib.installHeadersDirectory("include/" ++ subdir, subdir);
    }
    b.installArtifact(lib);
}
