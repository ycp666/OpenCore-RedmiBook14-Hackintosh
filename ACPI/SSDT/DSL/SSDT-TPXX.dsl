/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLFmfPKP.aml, Fri May  7 22:38:08 2021
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002C6 (710)
 *     Revision         0x02
 *     Checksum         0xDE
 *     OEM ID           "XMCC"
 *     OEM Table ID     "TPXX"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "XMCC", "TPXX", 0x00000000)
{
    External (_SB_.GNUM, MethodObj)    // 1 Arguments
    External (_SB_.INUM, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.HIDD, MethodObj)    // 5 Arguments
    External (_SB_.PCI0.I2C1.HIDG, IntObj)
    External (_SB_.PCI0.I2C1.TP7D, MethodObj)    // 6 Arguments
    External (_SB_.PCI0.I2C1.TP7G, IntObj)
    External (_SB_.SHPO, MethodObj)    // 2 Arguments
    External (_SB_.TPTP, MethodObj)    // 0 Arguments
    External (TPIT, IntObj)

    Scope (_SB.PCI0.I2C1)
    {
        Device (TPXX)
        {
            Name (SBFS, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Name (SBFE, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
            })
            Name (SBFG, ResourceTemplate ()
            {
                GpioInt (Level, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })
            Name (SBFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y00)
                {
                    0x00000000,
                }
            })
            CreateWordField (SBFG, 0x17, INT1)
            CreateDWordField (SBFI, \_SB.PCI0.I2C1.TPXX._Y00._INT, INT2)  // _INT: Interrupts
            Name (IRQM, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((TPIT != 0xFFFFFFFF))
                {
                    INT1 = GNUM (TPIT)
                    INT2 = INUM (TPIT)
                    If ((IRQM == Zero))
                    {
                        SHPO (TPIT, One)
                    }
                }
            }

            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Local0 = \_SB.TPTP ()
                If ((Local0 == One))
                {
                    Return ("SYN1B7F")
                }

                Return ("ELAN2304")
            }

            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                Local0 = \_SB.TPTP ()
                If ((Local0 == One))
                {
                    If ((Arg0 == HIDG))
                    {
                        Return (HIDD (Arg0, Arg1, Arg2, Arg3, 0x20))
                    }

                    If ((Arg0 == TP7G))
                    {
                        Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFS, SBFG))
                    }
                }

                If ((Arg0 == HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, One))
                }

                If ((Arg0 == TP7G))
                {
                    Return (TP7D (Arg0, Arg1, Arg2, Arg3, SBFE, SBFG))
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ConcatenateResTemplate (SBFE, SBFG))
            }
        }
    }
}

