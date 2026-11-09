/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct BlurMaterialSeparatedLayer1020 {
  @Builder
  PreviewBuilder() {
    Text('预览')
      .fontSize(16)
      .padding(10)
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItemGroup() {
        MenuItem({ content: '菜单项1' })
      }
    }
    .backgroundBlurStyle(undefined)
  }

  build() {
    Column() {
      Text('菜单控制')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Button('bindContextMenu02')
        .id('bindContextMenu02Btn1020')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .onClick(() => {
          console.info('bindContextMenu02 clicked');
        })

      Button('060')
        .id('menuBtn1020')
        .width(300)
        .height(50)
        .margin({ bottom: 10 })
        .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
          enableArrow: true,
          preview: this.PreviewBuilder
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F5F5F5')
  }
}

