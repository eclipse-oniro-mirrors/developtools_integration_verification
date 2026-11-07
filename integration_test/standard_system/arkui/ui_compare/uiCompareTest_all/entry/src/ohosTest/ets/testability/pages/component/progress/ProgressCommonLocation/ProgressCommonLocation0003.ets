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
struct ProgressCommonLocation0003 {

  build() {
    Column({space: 10}) {
      Text('Progress Eclipse组件测试')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      // 1. Progress组件设置value为50，type为ProgressType.Eclipse
      Progress({ value: 50, total: 100, type: ProgressType.Eclipse })
        .id('progress_eclipse_0003')
        .width(200)
        .height(200)
        .margin({ top: 20 })
        .direction(Direction.Ltr)

      // 2. 查看Progress展示效果
      Text('Eclipse类型Progress组件展示效果')
        .fontSize(16)
        .fontColor(Color.Gray)
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}


