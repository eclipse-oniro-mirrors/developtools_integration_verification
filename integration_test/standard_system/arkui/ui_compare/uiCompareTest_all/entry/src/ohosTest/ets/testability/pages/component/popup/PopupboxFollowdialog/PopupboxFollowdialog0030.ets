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
struct PopupboxFollowdialog0030 {
  @State visible: boolean = false

  @Builder
  popoverContent() {
    Column() {
      Text('Popover Content')
        .fontSize(16)
        .fontColor(Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column({ space: 20 }) {
      // 注释掉targetBuilder/绑定组件的代码，验证必填性
      // bindPopup必须绑定到一个组件上才能正常工作
      // .bindPopup(this.visible, {
      //   builder: this.popoverContent,
      //   placement: Placement.Bottom
      // })
      Text('targetBuilder参数设置为undefined验证')
        .fontSize(16)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
