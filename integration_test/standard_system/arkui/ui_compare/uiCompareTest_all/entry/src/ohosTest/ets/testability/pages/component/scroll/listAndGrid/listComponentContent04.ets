/**
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

import { ComponentContent } from '@kit.ArkUI';

@Builder
function buildHeader04() {
  Column() {
    Text('Sticky Header')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
  }
}

@Builder
function buildFooter04() {
  Column() {
    Text('Sticky Footer')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xCCDDFF)
  }
}

@Entry
@Component
struct ListComponentContent04 {
  @State stickyStyle: StickyStyle = StickyStyle.Header;
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = [];
  
  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    for (let i = 0; i < 20; i++) {
      this.listData.push(`Item ${i + 1}`);
    }
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader04));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter04));
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0040')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Button('Sticky')
        .id('stickyButton_04')
        .onClick(() => {
          // 遍历StickyStyle枚举值：Header -> Footer -> Header | Footer -> Header
          if (this.stickyStyle === StickyStyle.Header) {
            this.stickyStyle = StickyStyle.Footer;
          } else if (this.stickyStyle === StickyStyle.Footer) {
            this.stickyStyle = StickyStyle.Header | StickyStyle.Footer;
          } else {
            this.stickyStyle = StickyStyle.Header;
          }
        })
        .margin({ bottom: 10 });

      List({ space: 10 }) {
        ListItemGroup(
          (this.headerComponent && this.footerComponent) ? {
            headerComponent: this.headerComponent,
            footerComponent: this.footerComponent
          } : undefined
        ) {
          ForEach(this.listData, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(100)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF5F5F5)
            }
          }, (item: string) => item)
        }
      }
      .id('listComponentContent_04')
      .width('100%')
      .layoutWeight(1)
      .sticky(this.stickyStyle)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}
