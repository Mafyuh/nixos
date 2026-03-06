{ ... }: {
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.enableRedistributableFirmware = true;
}
