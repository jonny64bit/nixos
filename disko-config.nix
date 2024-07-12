{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
                size = "1M";
                type = "EF02";
            };
            ESP = {
              # name = "ESP";
              size = "1G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            swap = {
              # name = "swap";
              size = "8G";
              content = {
                type = "swap";
                randomEncryption = true;
              };
            };
            root = {
              # name = "root";
              size = "100%";
              content = {
                type = "btrfs";
                subvolumes = 
                    {
                      "@" = { };
                      "@/root" = {
                        mountpoint = "/";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      "@/home" = {
                        mountpoint = "/home";
                        mountOptions = [ "compress=zstd" ];
                      };
                      "@/nix" = {
                        mountpoint = "/nix";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      "@/var-lib" = {
                        mountpoint = "/var/lib";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      "@/var-log" = {
                        mountpoint = "/var/log";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      "@/var-tmp" = {
                        mountpoint = "/var/tmp";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                    };
             };
            };
          };
        };
      };
    };
  };
}
