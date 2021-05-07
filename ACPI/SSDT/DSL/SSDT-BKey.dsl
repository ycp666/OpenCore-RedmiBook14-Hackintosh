/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLNnCUWx.aml, Fri May  7 22:37:17 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000012F (303)
 *     Revision         0x02
 *     Checksum         0xFC
 *     OEM ID           "ACDT"
 *     OEM Table ID     "BKey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "BKey", 0x00000000)
{
    External (_SB_.PCI0.LPCB.EC0_, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.XQ1C, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.EC0_.XQ1D, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.PS2M, DeviceObj)

    Scope (_SB.PCI0.LPCB.EC0)
    {
        Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2M, 0x0405)
                Notify (\_SB.PCI0.LPCB.PS2M, 0x20) // Reserved
            }
            Else
            {
                XQ1C ()
            }
        }

        Method (_Q1C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPCB.PS2M, 0x0406)
                Notify (\_SB.PCI0.LPCB.PS2M, 0x10) // Reserved
            }
            Else
            {
                XQ1D ()
            }
        }
    }
}

