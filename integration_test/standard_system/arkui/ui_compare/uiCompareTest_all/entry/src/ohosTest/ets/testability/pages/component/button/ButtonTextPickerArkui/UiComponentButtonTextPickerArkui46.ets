/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SymbolGlyphModifier } from '@kit.ArkUI';

class MyMenuItemContentModifier implements ContentModifier<MenuItemConfiguration> {
  public modifierText: string = '';

  constructor(text: string) {
    this.modifierText = text;
  }

  applyContent(): WrappedBuilder<[MenuItemConfiguration]> {
    return wrapBuilder(menuItemBuilder);
  }
}

@Builder
function menuItemBuilder(configuration: MenuItemConfiguration) {
  Row() {
    Text(configuration.value)
      .fontColor(configuration.selected ? Color.Blue : '#182431')
      .fontStyle(FontStyle.Italic)
      .fontWeight(500)
    Blank()
    if (configuration.symbolIcon) {
      SymbolGlyph()
        .attributeModifier(configuration.symbolIcon)
        .fontSize(24)
    } else if (configuration.icon) {
      Image(configuration.icon)
        .size({ width: 24, height: 24 })
    }
    Blank(30)
    Text((configuration.contentModifier as MyMenuItemContentModifier).modifierText)
    Blank(30)
    Path()
      .width('100px')
      .height('150px')
      .commands('M40 0 L80 100 L0 100 Z')
      .fillOpacity(0)
      .stroke(Color.Black)
      .strokeWidth(3)
  }
  .onClick(() => {
    configuration.triggerSelect(configuration.index, configuration.value.valueOf().toString());
  })
}

@Entry
@Component
struct UiComponentButtonTextPickerArkui46 {
  @State text: string = 'TTTTT';
  @State symbolModifier1: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.ohos_trash'))
      .fontColor([Color.Gray]);
  @State symbolModifier2: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.exposure'))
      .fontColor([Color.Gray]);
  @State symbolModifier3: SymbolGlyphModifier =
    new SymbolGlyphModifier($r('sys.symbol.wifi'))
      .fontColor([Color.Gray]);
  @State text2 : string ='select controlSize  to NORMAL'

  build() {
    Column() {
      Row() {
        Select([{ value: 'item1', icon: $r('app.media.icon'), symbolIcon: this.symbolModifier1 },
          { value: 'item2', icon: $r('app.media.icon'), symbolIcon: this.symbolModifier2 },
          { value: 'item3', icon: $r('app.media.icon'), symbolIcon: this.symbolModifier3 }
        ])
          .controlSize(ControlSize.NORMAL)
          .value(this.text)
          .selected(2)
          .id('UiComponentButtonTextPickerArkui46')
          .onSelect((index: number, text?: string) => {
            console.info('Select index:' + index);
            console.info('Select text:' + text);
          })
          .menuItemContentModifier(new MyMenuItemContentModifier('Content Modifier'))
      }
      .alignItems(VerticalAlign.Center)
      .height('50%')
      Text(this.text2)
        .fontSize(18)
        .maxLines(3)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bolder)
        .border({ width: 1, color: 0xEEEEEE })
        .padding(10)
        .margin({
          left: 6,
          right: 6,
          top: 10,
          bottom: 10
        })
    }
  }
}