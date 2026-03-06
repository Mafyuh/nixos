{ pkgs, ... }: {
  hardware.amdgpu.initrd.enable = true;
  hardware.amdgpu.opencl.enable = true;
  hardware.enableRedistributableFirmware = true;

  hardware.graphics.extraPackages = with pkgs; [
    rocmPackages.clr.icd
  ];
}
