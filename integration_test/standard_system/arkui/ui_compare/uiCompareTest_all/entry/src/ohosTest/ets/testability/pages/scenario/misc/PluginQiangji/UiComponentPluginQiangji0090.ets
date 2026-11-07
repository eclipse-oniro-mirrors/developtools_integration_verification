/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
struct UiComponentPluginQiangji0090 {
  private items: number[] = [
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
    31, 32, 33, 34, 35, 36, 37, 38, 39
  ]
  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_ARKUI_QIANGJI_SHAPE_MULTITHREAD_0090')
        .fontSize(12)
      Flex({ wrap: FlexWrap.Wrap }) {
        ForEach(this.items, (item: number) => {
          Ellipse().width(6).height(6)
        }, (item: number) => item.toString())
      }
      .width('100%')
      .id('shape_batch_host')
      Text(`count_${this.items.length}`)
        .id('shape_batch_status')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .padding(12)
  }
}
