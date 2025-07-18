# 📦 ShieldRig Widgets Reference

Listado oficial de widgets con su ubicación, propósito y características.

---

## 🏗️ Core Widgets

### **`AppButton`**  
`lib/widgets/app_button.dart`  
→ Botón premium con 5 variantes (`primary`, `secondary`, `ghost`, `text`, `danger`) y 3 tamaños (`sm`, `md`, `lg`). Incluye loading states con CircularProgressIndicator, iconos leading/trailing, disabled states y colores dinámicos del theme. Soporta width/height personalizables.

### **`AppInteractiveBox`**  
`lib/widgets/app_interactive_box.dart`  
→ Contenedor táctil con estados de selección, bordes dinámicos y colores personalizables. Soporta `isSelected`, `disabled`, colores de borde y fondo separados, width/height opcionales y alignment. Ideal para cards interactivas y elementos seleccionables.

### **`AppCard`**  
`lib/widgets/app_card.dart`  
→ Card premium con 4 variantes (`elevated`, `flat`, `outline`, `bordered`) y estados `isDisabled`, `isHovered`, `isSelected`. Soporta onTap/onLongPress, colores personalizables, elevation dinámica y shadows del theme. Incluye padding/margin opcionales.

### **`AppDivider`**  
`lib/widgets/app_divider.dart`  
→ Separador visual con orientación horizontal/vertical, grosor personalizable (`AppSizes.dividerHeight` por defecto), colores del theme, length opcional y margin/radius configurables.

---

## 📋 Form & Input Widgets

### **`AppTextField`**  
`lib/widgets/app_text_field.dart`  
→ Campo de texto premium con 7 variantes (`text`, `email`, `password`, `search`, `number`, `phone`, `url`) y 3 tamaños (`sm`, `md`, `lg`). Incluye label, hint, error/helper text, prefix/suffix icons, validación, obscureText para passwords, maxLines/maxLength, autofocus y estados disabled/readOnly.

### **`AppFormSection`**  
`lib/widgets/app_form_section.dart`  
→ Sección de formulario con header, campos agrupados y validación. Soporta collapsible sections, dividers y spacing consistente.

---

## 🎯 Action & Navigation Widgets

### **`AppActionSection`**  
`lib/widgets/app_action_section.dart`  
→ Sección premium para agrupar botones de acción con 3 layouts (`horizontal`, `vertical`, `stacked`) y 6 alineaciones (`start`, `center`, `end`, `spaceBetween`, `spaceAround`, `spaceEvenly`). Incluye spacing personalizable, padding, elevation, background, border, radius y divider opcional.

### **`AppActionRow`**  
`lib/widgets/app_action_row.dart`  
→ Fila de acciones con spacing automático y alineación flexible. Ideal para toolbars, barras de acción y grupos de botones horizontales.

### **`AppHeaderSection`**  
`lib/widgets/app_header_section.dart`  
→ Header premium de página con 4 variantes (`standard`, `large`, `compact`, `minimal`), título, subtítulo, descripción, leading/trailing actions, primary/secondary actions, back button opcional, divider, padding/margin personalizables, background color, borderRadius, elevation y layout stack/row. Incluye widgets de conveniencia `AppPageHeader` y `AppCompactHeader`.

---

## 📊 Content & Layout Widgets

### **`AppContentGroup`**  
`lib/widgets/app_content_group.dart`  
→ Agrupación premium de contenido con 4 variantes (`stacked`, `grid`, `flow`, `list`), título/subtítulo opcionales, spacing personalizable, padding/margin, background color, borderRadius, elevation, onItemTap callback y divider opcional. Incluye widgets de conveniencia `AppStackedGroup` y `AppGridGroup`.

### **`AppCardSection`**  
`lib/widgets/app_card_section.dart`  
→ Sección de card con header, contenido y acciones. Variantes `divider`, `spaced`, `compact`, `header` con collapsible support, header actions, toggle functionality y divider opcional.

### **`AppScreenBase`**  
`lib/widgets/app_screen_base.dart`  
→ Base premium para pantallas con scrollable opcional, safe area configurable, padding personalizable (`AppSpacing.lg` por defecto), maxWidth constraint, backgroundColor personalizable y Material wrapper.

---

## 🎨 Feedback & Overlay Widgets

### **`AppSnackbar`**  
`lib/widgets/app_snackbar.dart`  
→ Snackbar premium con 4 variantes (`success`, `error`, `warning`, `info`), título opcional, duration personalizable, action button, close button configurable, persistent mode, colores dinámicos del theme, borderRadius y shadow.

### **`AppBottomSheet`**  
`lib/widgets/app_bottom_sheet.dart`  
→ Bottom sheet premium con header opcional (título, subtítulo, descripción, trailing actions, primary/secondary actions), close button configurable, padding/maxWidth personalizables, backgroundColor, isDismissible/enableDrag, shape/clipBehavior y helper `AppBottomSheetHelper.show()`.

---

## 🧪 Utilidad futura

Una vez tengas esto listo, podrías:

- ✅ Validar con CLI que cada widget esté registrado (`validate-widget-docs`)
- 🧬 Usarlo como fuente para autogenerar una librería de documentación
- 🔗 Linkear este `.md` desde un sitio interno o Wiki del equipo
- 📊 Generar estadísticas de uso de widgets
- 🔍 Crear búsqueda y filtros por categoría

---

## 📈 Estadísticas

- **Total de widgets**: 14 widgets core
- **Categorías**: 5 categorías principales
- **Variantes soportadas**: 35+ variantes combinadas
- **Estados**: Loading, disabled, error, success, warning, info, hover, selected
- **Tamaños**: sm, md, lg en la mayoría de widgets
- **Widgets de conveniencia**: 4 widgets helper (AppPageHeader, AppCompactHeader, AppStackedGroup, AppGridGroup)

---

## 🛠️ CLI Integration

Todos los widgets están optimizados para el CLI de detección de hardcodeados:

```bash
# Verificar que no hay valores hardcodeados
dart run tools/shieldrig_cli.dart detect-hardcoded lib/

# Resultado esperado: ✅ No hardcodeados encontrados
```

---

*Documentación generada automáticamente - Última actualización: $(date)* 