/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLH72wbg.aml, Fri May  7 22:37:29 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000089 (137)
 *     Revision         0x02
 *     Checksum         0x4B
 *     OEM ID           "XMCC"
 *     OEM Table ID     "TPD0"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "XMCC", "TPD0", 0x00000000)
{
    External (_SB_.PCI0.I2C1.TPD0, DeviceObj)
    External (_SB_.PCI0.I2C1.TPD0.XSTA, MethodObj)    // 0 Arguments

    Scope (_SB.PCI0.I2C1.TPD0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (XSTA ())
            }
        }
    }
}

