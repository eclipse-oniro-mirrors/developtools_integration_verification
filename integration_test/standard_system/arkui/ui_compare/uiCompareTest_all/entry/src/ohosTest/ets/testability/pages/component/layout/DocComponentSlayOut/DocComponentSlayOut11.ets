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

@Entry
@Component
struct DocComponentSlayOut11 {
  @State symbolIconModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');
  @State symbolIconModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_photo')).fontSize('24vp');

  @Builder MenuBuilder() {
    Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Text('Test menu item 1')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
      Divider().height(10)
      Text('Test menu item 2')
        .fontSize(20)
        .width(100)
        .height(50)
        .textAlign(TextAlign.Center)
    }.width('100%')
  }
  @Builder
  MyPreview() {
    Column() {
      Image($r('app.media.icon'))
        .width(50)
        .height(50)
    }
  }
  @State isShow:boolean = false;
  private iconStr: ResourceStr = $r('app.media.icon');

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
      MenuItem({ startIcon: this.iconStr, content: '菜单选项' })
    }
  }
  build() {
    Column() {
      Column() {
        Text('LongPress for menu')
          .id('DocComponentSlayOut11_01')
      }
      .width('100%')
      .margin({ top: 5 })
      .bindContextMenu(this.MenuBuilder, ResponseType.RightClick)
      Column() {
        Text('click for Menu')
          .id('DocComponentSlayOut11_02')
      }
      .width('100%')
      .margin({ top: 5 })
      .bindMenu([
        {
          value: 'Menu1',
          symbolIcon:this.symbolIconModifier1,
          action: () => {
            console.info('handle Menu1 select');
          }
        },
        {
          value: 'Menu2',
          symbolIcon:this.symbolIconModifier2,
          action: () => {
            console.info('handle Menu2 select');
          }
        },
      ])
    }
    .width('100%')
    .margin({ top: 5 })
  }
}