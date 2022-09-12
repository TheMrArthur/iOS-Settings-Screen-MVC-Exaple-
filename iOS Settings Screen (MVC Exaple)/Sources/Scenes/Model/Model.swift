//
//  Model.swift
//  iOSSettingsScreen HW13
//
//  Created by Артур Горлов on 12.09.2022.
//

import UIKit

enum CellType {
    case defaultCell
    case switchCell
    case labelCell
    case imageCell
    case personalInfoCell
    case findingCell
}

struct CellSetups {
    var icon: UIImage?
    var iconBackgroundColor: UIColor?
    var nameCell: String?
    var rightLabel: String?
    var rightImage: UIImage?
    var cellType: CellType
    var personalImage: UIImage?
    var personalName: String?
}

struct SetupSections {
    var setupItem: [CellSetups]
}

extension SetupSections {
    static var setupSections: [SetupSections] = [
        SetupSections(setupItem: [
            CellSetups(cellType: .findingCell)
        ]),

        SetupSections(setupItem: [
            CellSetups(cellType: .personalInfoCell,
                       personalImage: UIImage(named: "personalImage"),
                       personalName: "Johny Silverhand")
        ]),

        SetupSections(setupItem: [
            CellSetups(icon: UIImage(systemName: "airplane")!,
                       iconBackgroundColor: .systemOrange,
                       nameCell: "Авиарежим",
                       cellType: .switchCell),
            CellSetups(icon: UIImage(systemName: "wifi")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Wi-Fi",
                       rightLabel: "Выкл.",
                       cellType: .labelCell),
            CellSetups(icon: UIImage(named: "bluetooth")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Bluetooth",
                       rightLabel: "Не подключен",
                       cellType: .labelCell),
            CellSetups(icon: UIImage(systemName: "antenna.radiowaves.left.and.right")!,
                       iconBackgroundColor: .systemGreen,
                       nameCell: "Сотовая связь",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "personalhotspot")!,
                       iconBackgroundColor: .systemGreen,
                       nameCell: "Режим модема",
                       rightLabel: "Выкл.",
                       cellType: .labelCell),
            CellSetups(icon: UIImage(named: "vpn")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "VPN",
                       rightLabel: "Не подключено",
                       cellType: .labelCell)
        ]),

        SetupSections(setupItem: [
            CellSetups(icon: UIImage(systemName: "bell.badge.fill")!,
                       iconBackgroundColor: .systemRed,
                       nameCell: "Уведомления",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "speaker.wave.3.fill")!,
                       iconBackgroundColor: .systemPink,
                       nameCell: "Звуки, тактильные сигналы",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "moon.fill")!,
                       iconBackgroundColor: .systemIndigo,
                       nameCell: "Фокусирование",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "hourglass")!,
                       iconBackgroundColor: .systemIndigo,
                       nameCell: "Экранное время",
                       cellType: .defaultCell)
        ]),

        SetupSections(setupItem: [
            CellSetups(icon: UIImage(systemName: "gear")!,
                       iconBackgroundColor: .systemGray,
                       nameCell: "Основные",
                       rightImage: UIImage(systemName: "circle.fill"),
                       cellType: .imageCell),
            CellSetups(icon: UIImage(systemName: "switch.2")!,
                       iconBackgroundColor: .systemGray,
                       nameCell: "Пункт управления",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "textformat.size")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Экран и яркость",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "homescreen")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Экран «Домой»",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "accessibility")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Универсальный доступ",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "wallpapers")!,
                       iconBackgroundColor: .systemCyan,
                       nameCell: "Обои",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "siri")!,
                       iconBackgroundColor: .black,
                       nameCell: "Siri и поиск",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "faceid")!,
                       iconBackgroundColor: .systemGreen,
                       nameCell: "Face ID и код-пароль",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "sos")!,
                       iconBackgroundColor: .systemRed,
                       nameCell: "Экстренный вызов - SOS",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(named: "contactNotification")!,
                       iconBackgroundColor: .white,
                       nameCell: "Уведомления о контакте",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "battery.100")!,
                       iconBackgroundColor: .systemGreen,
                       nameCell: "Аккумулятор",
                       cellType: .defaultCell),
            CellSetups(icon: UIImage(systemName: "hand.raised.fill")!,
                       iconBackgroundColor: .systemBlue,
                       nameCell: "Конфеденциальность",
                       cellType: .defaultCell)
        ]),
    ]
}
