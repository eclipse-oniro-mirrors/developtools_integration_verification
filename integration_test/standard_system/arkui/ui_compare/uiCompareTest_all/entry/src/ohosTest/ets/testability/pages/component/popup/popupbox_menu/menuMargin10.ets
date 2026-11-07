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
struct MenuMargin10 {
  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ content: '菜单项1' })
      MenuItem({ content: '菜单项2' })
      MenuItem({ content: '菜单项3' })
    }
  }

  @Builder
  MyPreview() {
    Column() {
    }
    .backgroundColor(Color.Pink)
    .width('100%')
    .height('100%')
  }

  build() {
    Column() {
      Image($r('app.media.icon'))
        .id('menu_image_10')
        .width(200)
        .height(200)
        .bindContextMenu(this.MyMenu, ResponseType.LongPress, {
          preview: this.MyPreview,
          layoutRegionMargin: { top: 10, bottom: 10, left: 200, right: 5000 },
          previewAnimationOptions: { scale: [0.8, 3.0] }
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor(0xF5F5F5)
  }
}

