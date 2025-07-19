# 📦 ShieldRig Widgets Reference

Listado oficial de widgets con su ubicación, propósito y características.

---

## 🏗️ Core Widgets

### **`AppButton`**  
`lib/widgets/app_button.dart`  
**Tags:** `button`, `interactive`, `stateful`, `primary`, `danger`, `loading`, `icon`  
→ Botón premium con 5 variantes (`primary`, `secondary`, `ghost`, `text`, `danger`) y 3 tamaños (`sm`, `md`, `lg`). Incluye loading states con CircularProgressIndicator, iconos leading/trailing, disabled states y colores dinámicos del theme. Soporta width/height personalizables.  
✅ Tests: `test/widgets/app_button_test.dart`

### **`AppInteractiveBox`**  
`lib/widgets/app_interactive_box.dart`  
**Tags:** `container`, `interactive`, `selectable`, `stateful`, `border`  
→ Contenedor táctil con estados de selección, bordes dinámicos y colores personalizables. Soporta `isSelected`, `disabled`, colores de borde y fondo separados, width/height opcionales y alignment. Ideal para cards interactivas y elementos seleccionables.  
✅ Tests: `test/widgets/app_interactive_box_test.dart`

### **`AppCard`**  
`lib/widgets/app_card.dart`  
**Tags:** `card`, `container`, `elevated`, `flat`, `outline`, `visual`  
→ Card premium con 4 variantes (`elevated`, `flat`, `outline`, `bordered`) y estados `isDisabled`, `isHovered`, `isSelected`. Soporta onTap/onLongPress, colores personalizables, elevation dinámica y shadows del theme. Incluye padding/margin opcionales. **Puramente visual** - para contenido dinámico usar widgets funcionales como `AppContentSection`, `AppFormSection`, etc.  
✅ Tests: `test/widgets/app_card_test.dart`

### **`AppDivider`**  
`lib/widgets/app_divider.dart`  
**Tags:** `divider`, `separator`, `visual`, `horizontal`, `vertical`  
→ Separador visual con orientación horizontal/vertical, grosor personalizable (`AppSizes.dividerHeight` por defecto), colores del theme, length opcional y margin/radius configurables.  
✅ Tests: `test/widgets/app_divider_test.dart`

---

## 📋 Form & Input Widgets

### **`AppTextField`**  
`lib/widgets/app_text_field.dart`  
**Tags:** `input`, `form`, `text`, `validation`, `password`, `search`  
→ Campo de texto premium con 7 variantes (`text`, `email`, `password`, `search`, `number`, `phone`, `url`) y 3 tamaños (`sm`, `md`, `lg`). Incluye label, hint, error/helper text, prefix/suffix icons, validación, obscureText para passwords, maxLines/maxLength, autofocus y estados disabled/readOnly.  
✅ Tests: `test/widgets/app_text_field_test.dart`

### **`AppFormSection`**  
`lib/widgets/app_form_section.dart`  
**Tags:** `form`, `section`, `group`, `validation`, `collapsible`  
→ Sección de formulario con header, campos agrupados y validación. Soporta collapsible sections, dividers y spacing consistente.  
✅ Tests: `test/widgets/app_form_section_test.dart`

---

## 🎯 Action & Navigation Widgets

### **`AppActionSection`**  
`lib/widgets/app_action_section.dart`  
**Tags:** `action`, `button-group`, `layout`, `horizontal`, `vertical`, `stacked`  
→ Sección premium para agrupar botones de acción con 3 layouts (`horizontal`, `vertical`, `stacked`) y 6 alineaciones (`start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly`). Incluye spacing personalizable, padding, elevation, background, border, radius y divider opcional.  
✅ Tests: `test/widgets/app_action_section_test.dart`

### **`AppActionRow`**  
`lib/widgets/app_action_row.dart`  
**Tags:** `action`, `row`, `toolbar`, `horizontal`, `spacing`  
→ Fila de acciones con spacing automático y alineación flexible. Ideal para toolbars, barras de acción y grupos de botones horizontales.  
✅ Tests: `test/widgets/app_action_row_test.dart`

### **`AppHeaderSection`**  
`lib/widgets/app_header_section.dart`  
**Tags:** `header`, `navigation`, `title`, `actions`, `compact`, `large`  
→ Header premium de página con 4 variantes (`standard`, `large`, `compact`, `minimal`), título, subtítulo, descripción, leading/trailing actions, primary/secondary actions, back button opcional, divider, padding/margin personalizables, background color, borderRadius, elevation y layout stack/row. Incluye widgets de conveniencia `AppPageHeader` y `AppCompactHeader`.  
✅ Tests: `test/widgets/app_header_section_test.dart`

### **`AppBottomNavBar`**  
`lib/widgets/navigation/app_bottom_nav_bar.dart`  
**Tags:** `navigation`, `bottom-nav`, `animated`, `indicator`, `responsive`  
→ Barra de navegación inferior premium estilo Phantom con indicador animado superior, lista de ítems personalizables (`AppBottomNavItem`), colores dinámicos del theme y labels opcionales. Características: `currentIndex`, `onItemSelected`, `showLabels`, `backgroundColor`, `activeColor`, `inactiveColor`, `elevation`, `height`, `indicatorHeight/Width`, animaciones suaves (300ms), SafeArea automático, responsive design. Incluye helper `AppBottomNavBarHelper` para creación rápida de patrones comunes y soporte para íconos activos/inactivos separados.  
✅ Tests: `test/widgets/navigation/app_bottom_nav_bar_test.dart`

---

## 📊 Content & Layout Widgets

### **`AppContentGroup`**  
`lib/widgets/app_content_group.dart`  
**Tags:** `content`, `group`, `layout`, `stacked`, `grid`, `flow`, `list`  
→ Agrupación premium de contenido con 4 variantes (`stacked`, `grid`, `flow`, `list`), título/subtítulo opcionales, spacing personalizable, padding/margin, background color, borderRadius, elevation, onItemTap callback y divider opcional. Incluye widgets de conveniencia `AppStackedGroup` y `AppGridGroup`.  
✅ Tests: `test/widgets/app_content_group_test.dart`

### **`AppContentSection`**  
`lib/widgets/app_content_section.dart`  
**Tags:** `content`, `section`, `header`, `divider`, `spaced`, `compact`  
→ Sección de contenido con header, contenido y acciones. Variantes `divider`, `spaced`, `compact`, `header` con collapsible support, header actions, toggle functionality y divider opcional.  
✅ Tests: `test/widgets/app_content_section_test.dart`

### **`AppScreenBase`**  
`lib/widgets/app_screen_base.dart`  
**Tags:** `screen`, `base`, `layout`, `scrollable`, `safe-area`, `responsive`  
→ Base premium para pantallas con scrollable opcional, safe area configurable, padding personalizable (`AppSpacing.lg` por defecto), maxWidth constraint, backgroundColor personalizable y Material wrapper.  
✅ Tests: `test/widgets/app_screen_base_test.dart`

---

## 📊 Dashboard Widgets

### **`AppDashboardScreen`**  
`lib/widgets/dashboard/app_dashboard_screen.dart`  
**Tags:** `dashboard`, `screen`, `tabs`, `navigation`, `modular`, `responsive`  
→ Pantalla de dashboard premium modular y reutilizable con tabs configurables, header opcional por tab, navegación inferior integrada y contenido flexible. Composición 100% de widgets existentes: `Scaffold` + `SafeArea` como base, `AppHeaderSection` opcional, `AppBottomNavBar` para navegación. Características: `currentTabIndex`, `onTabChanged`, `controller` (navegación programática), `showBottomNav`, `bottomNavItems`, `scrollable`, `safeArea`, `padding`, `maxWidth`, `backgroundColor`. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ 27/27 tests pasando.  
✅ Tests: `test/widgets/dashboard/app_dashboard_screen_test.dart`

### **`AppDashboardController`**  
`lib/widgets/dashboard/models/app_dashboard_controller.dart`  
**Tags:** `controller`, `navigation`, `programmatic`, `state-management`  
→ Controller para navegación programática del dashboard. Características: `jumpToTab(index)`, `animateToTab(index)`, `nextTab()`, `previousTab()`, `currentIndex` getter. Integrado con `AppDashboardScreen` para control externo de navegación y animaciones.

### **`AppDashboardTab`**  
`lib/widgets/dashboard/models/app_dashboard_tab.dart`  
**Tags:** `model`, `configuration`, `tab`, `header`, `actions`  
→ Modelo de configuración para tabs del dashboard. Propiedades: `key`, `child`, `showHeader`, `title`, `subtitle`, `headerActions`, `headerVariant`. Permite configuración granular por tab.

### **`AppSettingsTab`**  
`lib/widgets/dashboard/tabs/app_settings_tab.dart`  
**Tags:** `settings`, `tab`, `placeholder`, `log-out`, `bottom-sheet`  
→ Tab por defecto para Settings con contenido placeholder listo para implementación. Incluye botón de Log Out que abre AppBottomSheet vacío. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, listo para diseño.  
✅ Tests: `test/widgets/dashboard/tabs/app_settings_tab_test.dart`

---

## ⚙️ Settings Widgets

### **`SettingsSectionCard`**  
`lib/widgets/settings/settings_section_card.dart`  
**Tags:** `settings`, `card`, `section`, `title`, `visual`  
→ Card premium para secciones de configuración con título, padding controlado y estructura consistente. Usa `AppCard` con variant `flat`, padding interno cero, título con padding izquierdo y superior, y spacing vertical medio (`AppSpacing.mdVerticalGap`) entre título y botones. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ tests pasando.  
✅ Tests: `test/widgets/settings/settings_section_card_test.dart`

### **`SettingsListTile`**  
`lib/widgets/settings/settings_list_tile.dart`  
**Tags:** `settings`, `list-tile`, `interactive`, `icon`, `trailing-text`, `chevron`  
→ Tile de lista para configuración estilo Instagram con `AppCard` como base visual. Características: icono, título, trailing text opcional, chevron automático, padding controlado por caller, interacción completa (toda la celda tappeable), colores del theme (`context.colors`, `context.textStyle`), tamaños del design system (`AppSizes.iconSizeMd/Sm`), styling personalizable (`titleStyle`, `iconColor`). **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ tests pasando.  
✅ Tests: `test/widgets/settings/settings_list_tile_test.dart`

### **`DefaultSettingsGroup`**  
`lib/widgets/settings/default_settings_group.dart`  
**Tags:** `settings`, `group`, `encapsulation`, `title`, `items`  
→ Widget premium para encapsular grupos de configuración con título y lista de items. Usa `SettingsSectionCard` como base y maneja automáticamente el layout de `SettingsListTile`. Características: título de sección, lista de items, padding personalizable (defaults a `AppSpacing.mdPadding`), estructura consistente. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ 6/6 tests pasando.  
✅ Tests: `test/widgets/settings/default_settings_group_test.dart`

### **`AppSettingsDetailScreen`**  
`lib/widgets/settings/app_settings_detail_screen.dart`  
**Tags:** `settings`, `screen`, `detail`, `app-bar`, `scrollable`, `reusable`  
→ Pantalla premium reutilizable para detalles de configuración. Características: AppBar con título y botón de volver, scroll activado por defecto, padding interno controlado por design system, expansión completa (`double.infinity`), widget child personalizable, estilo visual consistente. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ 10/10 tests pasando.  
✅ Tests: `test/widgets/settings/app_settings_detail_screen_test.dart`

### **`SettingsDetailScreen`**  
`lib/widgets/settings/settings_detail_screen.dart`  
**Tags:** `settings`, `screen`, `complete`, `groups`, `trailing-text`, `danger-styling`  
→ Pantalla completa de configuración premium con 7 grupos organizados y 16 items. Grupos: Account (3), Notifications (2), Appearance (2), Privacy (2), Support (2), About (3), Account Actions (2). Características: trailing text informativo (Theme, Language, App Version), styling de peligro para acciones destructivas (Log Out, Delete Account), íconos apropiados para cada item, estructura modular y escalable. **Estado**: ✅ 0 hardcodeados, ✅ 0 warnings, ✅ 16/16 tests pasando.  
✅ Tests: `test/widgets/settings/settings_detail_screen_test.dart`

---

## 👤 Profile Widgets

### **`AppProfileAvatar`**  
`lib/widgets/profile/app_profile_avatar.dart`  
**Tags:** `profile`, `avatar`, `image`, `fallback`, `loading`, `circular`  
→ Avatar premium con múltiples variantes, tamaños configurables, imagen de perfil, fallback con iniciales, border radius personalizable y estados de loading. Soporta imagen de red, placeholder, y colores del theme.  
✅ Tests: `test/widgets/profile/app_profile_avatar_test.dart`

### **`AppProfileHeader`**  
`lib/widgets/profile/app_profile_header.dart`  
**Tags:** `profile`, `header`, `avatar`, `actions`, `responsive`, `layout`  
→ Header de perfil premium con avatar, información del usuario, acciones y layout flexible. Incluye nombre, email, descripción opcional, acciones primarias/secundarias y responsive design.  
✅ Tests: `test/widgets/profile/app_profile_header_test.dart`

---

## 🎨 Feedback & Overlay Widgets

### **`AppNoticeCard`**  
`lib/widgets/app_notice_card/app_notice_card.dart`  
**Tags:** `notice`, `card`, `feedback`, `info`, `success`, `warning`, `error`, `dismissible`  
→ Notice card premium con 5 variantes (`info`, `success`, `warning`, `error`, `neutral`), altura fija (96px), título/subtítulo, iconos automáticos, close button opcional, onTap callback. Usa composición híbrida: `AppCard` (base) + `AppContentSection` (estructura) + lógica de colores de `AppSnackbar`. Incluye helper `AppNoticeCardHelper` con métodos `createInfoNotice()`, `createSuccessNotice()`, `createWarningNotice()`, `createErrorNotice()`, `createNeutralNotice()`, `createDismissibleNotice()`.  
✅ Tests: `test/widgets/app_notice_card/app_notice_card_test.dart`

### **`AppSnackbar`**  
`lib/widgets/app_snackbar.dart`  
**Tags:** `snackbar`, `feedback`, `toast`, `temporary`, `action`, `dismissible`  
→ Snackbar premium con 4 variantes (`success`, `error`, `warning`, `info`), título opcional, duration personalizable, action button, close button configurable, persistent mode, colores dinámicos del theme, borderRadius y shadow.  
✅ Tests: `test/widgets/app_snackbar_test.dart`

### **`AppBottomSheet`**  
`lib/widgets/app_bottom_sheet.dart`  
**Tags:** `bottom-sheet`, `modal`, `overlay`, `header`, `actions`, `dismissible`  
→ Bottom sheet premium con header opcional (título, subtítulo, descripción, trailing actions, primary/secondary actions), close button configurable, padding/maxWidth personalizables, backgroundColor, isDismissible/enableDrag, shape/clipBehavior y helper `AppBottomSheetHelper.show()`.  
✅ Tests: `test/widgets/app_bottom_sheet_test.dart`

---

## 🧰 Widget Helpers

### **`AppNoticeCardHelper`**  
`lib/widgets/app_notice_card/app_notice_card_helper.dart`  
**Tags:** `helper`, `convenience`, `factory`, `notice`  
→ Helper con métodos de conveniencia para crear notice cards: `createInfoNotice()`, `createSuccessNotice()`, `createWarningNotice()`, `createErrorNotice()`, `createNeutralNotice()`, `createDismissibleNotice()`.

### **`AppBottomSheetHelper`**  
`lib/widgets/app_bottom_sheet.dart`  
**Tags:** `helper`, `convenience`, `modal`, `show`  
→ Helper con método `show()` para mostrar bottom sheets de forma conveniente.

### **`AppBottomNavBarHelper`**  
`lib/widgets/navigation/app_bottom_nav_bar.dart`  
**Tags:** `helper`, `convenience`, `navigation`, `patterns`  
→ Helper para crear patrones comunes de navegación inferior.

### **`AppDashboardScreenHelper`**  
`lib/widgets/dashboard/helpers/app_dashboard_screen_helper.dart`  
**Tags:** `helper`, `convenience`, `dashboard`, `factory`  
→ Helper con métodos de conveniencia para crear dashboards: `create()`, `createTabs()`, `createDashboardCard()`, `createMetricsCard()` para patrones comunes.

### **`AppSettingsTabHelper`**  
`lib/widgets/dashboard/helpers/app_settings_tab_helper.dart`  
**Tags:** `helper`, `convenience`, `settings`, `tab`  
→ Helper para crear el tab de Settings con configuración estándar. Métodos: `createSettingsTab()`, `createSettingsNavItem()` con icono `Icons.manage_accounts` y título "Settings".

---

## 🎨 Theme Components

### **`AppColors`**  
`lib/theme/app_colors.dart`  
**Tags:** `theme`, `colors`, `semantic`, `light`, `dark`, `palette`  
→ Paleta de colores semántica con variantes light/dark, colores de marca, background, text, semantic colors (error, warning, success, info), UI colors y colores adicionales.

### **`AppTextStyle`**  
`lib/theme/app_text_style.dart`  
**Tags:** `theme`, `typography`, `text`, `font`, `scale`, `semantic`  
→ Escala tipográfica semántica con Inter font, heading1-6, body1-2, caption, overline, button, label y métodos de conveniencia.

### **`AppSpacing`**  
`lib/theme/app_spacing.dart`  
**Tags:** `theme`, `spacing`, `margin`, `padding`, `gaps`, `system`  
→ Sistema de espaciado consistente con valores xs, sm, md, lg, xl, gaps verticales/horizontales y padding/margin helpers.

### **`AppSizes`**  
`lib/theme/app_sizes.dart`  
**Tags:** `theme`, `sizes`, `semantic`, `icons`, `buttons`, `inputs`  
→ Constantes de tamaño semánticas para iconos, botones, campos de formulario, toolbars, cards, inputs, avatars, badges, progress, dividers, shadows, breakpoints y getters de conveniencia.

### **`AppRadius`**  
`lib/theme/app_radius.dart`  
**Tags:** `theme`, `radius`, `border-radius`, `circular`, `rounded`  
→ Sistema de border radius consistente con valores default, sm, md, lg, xl, circular y helpers para diferentes contextos.

### **`AppOpacities`**  
`lib/theme/app_opacities.dart`  
**Tags:** `theme`, `opacity`, `transparency`, `shadows`, `overlays`  
→ Sistema de opacidades para shadows, disabled states, overlays y diferentes niveles de transparencia.

### **`AppIcons`**  
`lib/theme/app_icons.dart`  
**Tags:** `theme`, `icons`, `semantic`, `navigation`, `actions`, `status`  
→ Sistema de íconos semánticos organizados por categorías (navigation, actions, status, media, etc.) con valores consistentes.

### **`AppBreakpoints`**  
`lib/theme/app_breakpoints.dart`  
**Tags:** `theme`, `breakpoints`, `responsive`, `mobile`, `tablet`, `desktop`  
→ Sistema de breakpoints responsive para mobile, tablet, desktop con helpers de conveniencia y context extensions.

### **`AppDurations`**  
`lib/theme/app_durations.dart`  
**Tags:** `theme`, `duration`, `animation`, `timing`, `fast`, `slow`  
→ Sistema de duraciones para animaciones con valores fast, normal, slow y helpers para diferentes contextos.

---

## 🧪 Utilidad futura

Una vez tengas esto listo, podrías:

- ✅ Validar con CLI que cada widget esté registrado (`validate-widget-docs`)
- 🧬 Usarlo como fuente para autogenerar una librería de documentación
- 🔗 Linkear este `.md` desde un sitio interno o Wiki del equipo
- 📊 Generar estadísticas de uso de widgets
- 🔍 Crear búsqueda y filtros por categoría
- 🎨 Crear UI Gallery con ejemplos interactivos
- 🔗 Linkear tests automáticamente
- 📱 Generar playground interno tipo Storybook

---

## 📈 Estadísticas

- **Total de widgets**: 29 widgets core
- **Categorías**: 8 categorías principales
- **Variantes soportadas**: 60+ variantes combinadas
- **Estados**: Loading, disabled, error, success, warning, info, hover, selected, active/inactive
- **Tamaños**: sm, md, lg en la mayoría de widgets
- **Widgets de conveniencia**: 12 widgets helper
- **Controllers**: 1 controller (AppDashboardController) para navegación programática
- **Models**: 2 modelos (AppDashboardTab, AppDashboardController) para configuración
- **Theme Components**: 9 componentes de theme
- **Tests**: 191 tests totales, cobertura completa
- **Calidad**: 0 hardcodeados, 0 warnings en todos los widgets
- **Tags implementados**: 100+ tags para búsqueda y categorización

---

## 🛠️ CLI Integration

Todos los widgets están optimizados para el CLI de detección de hardcodeados:

```bash
# Verificar que no hay valores hardcodeados
dart run tools/shieldrig_cli.dart detect-hardcoded lib/

# Resultado esperado: ✅ No hardcodeados encontrados

# Validar exports (futuro)
dart run tools/shieldrig_cli.dart validate-widget-exports lib/

# Generar documentación (futuro)
dart run tools/shieldrig_cli.dart generate-widget-docs lib/
```

---

## 🎯 Estado de Calidad

### ✅ **Widgets Completamente Limpios:**
- **Core**: `AppButton`, `AppCard`, `AppDivider`, `AppInteractiveBox`
- **Form**: `AppTextField`, `AppFormSection`
- **Action**: `AppActionSection`, `AppActionRow`, `AppHeaderSection`
- **Navigation**: `AppBottomNavBar`
- **Content**: `AppContentGroup`, `AppContentSection`, `AppScreenBase`
- **Dashboard**: `AppDashboardScreen`, `AppDashboardTab`, `AppDashboardScreenHelper`
- **Settings**: `SettingsSectionCard`, `SettingsListTile`, `DefaultSettingsGroup`, `AppSettingsDetailScreen`, `SettingsDetailScreen`
- **Profile**: `AppProfileAvatar`, `AppProfileHeader`
- **Feedback**: `AppNoticeCard`, `AppSnackbar`, `AppBottomSheet`

### 🔍 **Verificaciones Automáticas:**
- **Hardcodeados**: `dart run tools/shieldrig_cli.dart detect-hardcoded lib/`
- **Análisis**: `flutter analyze lib/`
- **Tests**: `flutter test test/`
- **Exports**: `flutter test test/widgets_export_test.dart`

---

## 🎨 Ejemplos de Uso (Futuro UI Gallery)

```dart
// Botón primario con loading
AppButton(
  label: 'Continue',
  variant: AppButtonVariant.primary,
  isLoading: true,
  onPressed: () {},
)

// Settings list tile con trailing text
SettingsListTile(
  icon: Icons.palette,
  title: 'Theme',
  trailingText: 'Light',
  onTap: () {},
)

// Dashboard screen completo
AppDashboardScreen(
  tabs: [
    AppDashboardTab(
      title: 'Home',
      child: HomeContent(),
    ),
    AppDashboardTab(
      title: 'Settings',
      child: SettingsDetailScreen(),
    ),
  ],
)
```

---

*Documentación generada automáticamente - Última actualización: Julio 2025* 