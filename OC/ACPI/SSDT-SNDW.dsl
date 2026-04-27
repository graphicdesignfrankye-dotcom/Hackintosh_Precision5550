DefinitionBlock ("", "SSDT", 2, "DELL", "SNDW", 0x00000000)
{
    External (_SB.PCI0, DeviceObj)

    Scope (_SB.PCI0)
    {
        Device (SNDW)
        {
            Name (_ADR, Zero)
            Name (_STA, 0x0F)

            Device (SWHD)
            {
                Name (_ADR, Zero)
                Name (_STA, 0x0F)
            }

            Device (AMP0)
            {
                Name (_ADR, One)
                Name (_STA, 0x0F)
            }
        }
    }
}

