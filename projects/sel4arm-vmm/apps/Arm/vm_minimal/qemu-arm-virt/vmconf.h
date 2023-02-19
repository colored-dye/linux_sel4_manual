#ifndef VMLINUX_QEMU_ARM_VIRT_H
#define VMLINUX_QEMU_ARM_VIRT_H

#include <sel4arm-vmm/vm.h

#define physBase 0x60000000

/* INTERRUPTS */
/* KERNEL_TIMER_IRQ generated from /timer */
#ifdef CONFIG_ARM_HYPERVISOR_SUPPORT
#define KERNEL_TIMER_IRQ 26
#else
#define KERNEL_TIMER_IRQ 27
#endif /* CONFIG_ARM_HYPERVISOR_SUPPORT */

/* KERNEL DEVICES */
#define UART_PPTR (KDEV_PPTR + 0x0)
#define GIC_V2_DISTRIBUTOR_PPTR (KDEV_PPTR + 0x1000)
#define GIC_V2_CONTROLLER_PPTR (KDEV_PPTR + 0x2000)

/* PHYSICAL MEMORY */
static const p_region_t BOOT_RODATA avail_p_regs[] = {
    { 0x60000000, 0xc0000000 }, /* /memory@40000000 */
};

#endif
