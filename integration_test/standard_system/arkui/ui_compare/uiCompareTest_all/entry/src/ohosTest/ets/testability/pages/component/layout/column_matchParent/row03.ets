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
struct Row03 {

  build() {
    Column({ space: 5 }) {

      Text('Demo1').width('70%')
      Row() {
        // 设置子元素垂直方向间距为5
        Row()
          .width('13.89%')
          .height('16.39%')
          .backgroundColor(0xAFEEEE)
      }
      .width('13.89%')
      .height('16.39%')

      Text('Demo2').width('70%')
      Row() {
        Row()
          .width(LayoutPolicy.matchParent)
          .height(LayoutPolicy.matchParent)
          .backgroundColor(0xAFEEEE)
          .margin({top:30})
      }
      .width('13.89%')
      .height('16.39%')
      .margin({top:30})
    }
    .width('100%')
    .height('100%')
  }
}
