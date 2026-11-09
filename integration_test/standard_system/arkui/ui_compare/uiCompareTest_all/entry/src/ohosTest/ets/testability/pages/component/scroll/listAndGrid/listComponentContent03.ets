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
function buildHeader03() {
  Column() {
    Text('Header Component')
      .fontSize(18)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .height(60)
      .textAlign(TextAlign.Center)
      .backgroundColor(0xAABBCC)
  }
}

@Builder
function buildFooter03() {
  Column() {
    Text('Footer Component')
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
struct ListComponentContent03 {
  @State hasComponent: boolean = true;
  private uiContext: UIContext = this.getUIContext();
  private listData: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  private headerComponent: ComponentContent<Object> | null = null;
  private footerComponent: ComponentContent<Object> | null = null;

  aboutToAppear() {
    this.headerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildHeader03));
    this.footerComponent = new ComponentContent<Object>(this.uiContext, wrapBuilder(buildFooter03));
  }

  build() {
    Column() {
      Text('用例编号：SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_COMPONENT_0030')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Button('Test++')
        .id('testButton_03')
        .onClick(() => {
          this.hasComponent = !this.hasComponent;
        })
        .margin({ bottom: 10 });

      List({ space: 10 }) {
        ListItemGroup(
          this.hasComponent && this.headerComponent && this.footerComponent ? {
            headerComponent: this.headerComponent,
            footerComponent: this.footerComponent
          } : undefined
        ) {
          ForEach(this.listData, (item: string) => {
            ListItem() {
              Text(item)
                .width('100%')
                .height(80)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(0xF5F5F5)
            }
          }, (item: string) => item)
        }
      }
      .id('listComponentContent_03')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(0xFFFFFF)
  }
}

