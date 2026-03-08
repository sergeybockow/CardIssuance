# CardIssuance

A bank card ordering iOS application built with SwiftUI.

## Screenshots
_Add screenshots here_

## Features
- Card selection with horizontal carousel
- Color picker with snap behavior and card color preview
- Delivery address screen
- Address form with validation
- Order confirmation with success popup
- Dark/Light mode support

## Architecture
- **MVVM** + Coordinator pattern
- `@EnvironmentObject` for shared state across screens
- `CardService` for data layer
- Reusable UI components

## Components
- `PrimaryButton` — adaptive button with press animation
- `CardView` — async image loading with shimmer effect
- `ColorPickerView` — horizontal color carousel
- `FormTextField` — text field with validation highlight
- `AddressView` — address display component
- `ShimmerView` — loading skeleton animation

## Requirements
- iOS 17+
- Xcode 15+
- Swift 5.9+

## Installation
1. Clone the repository
2. Open `CardIssuance.xcodeproj`
3. Build and run

## Testing
Unit tests cover:
- Form validation logic
- Address model creation
- Mock data integrity

---

# CardIssuance

iOS приложение для заказа банковской карты на SwiftUI.

## Функциональность
- Выбор карты с горизонтальной каруселью
- Карусель выбора цвета с наложением на карту
- Экран адреса доставки
- Форма адреса с валидацией
- Подтверждение заказа с попапом успеха
- Поддержка тёмной и светлой темы

## Архитектура
- **MVVM** + паттерн Координатор
- `@EnvironmentObject` для общего состояния между экранами
- `CardService` для слоя данных
- Переиспользуемые UI компоненты

## Компоненты
- `PrimaryButton` — адаптивная кнопка с анимацией нажатия
- `CardView` — асинхронная загрузка изображений с shimmer эффектом
- `ColorPickerView` — горизонтальная карусель цветов
- `FormTextField` — текстовое поле с подсветкой валидации
- `AddressView` — компонент отображения адреса
- `ShimmerView` — анимация загрузки

## Требования
- iOS 17+
- Xcode 15+
- Swift 5.9+

## Установка
1. Клонировать репозиторий
2. Открыть `CardIssuance.xcodeproj`
3. Собрать и запустить

## Тесты
Юнит тесты покрывают:
- Логику валидации формы
- Создание модели адреса
- Целостность моковых данных
