/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

@Entry
@Component
struct UITransformationTestCase001 {
  build() {
    Row() {
      // 基准参考组件（红色）
      Text('Reference Position')
        .width(200)
        .height(100)
        .backgroundColor(Color.Red)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 10 })

      // 测试组件（蓝色），应用垂直平移
      Text('Translated Component')
        .width(200)
        .height(100)
        .backgroundColor(0x317aff) // 蓝色
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .translate({ y: '20%' }) // 关键属性设置
        .border({ width: 1, color: Color.Black })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#F0F0F0')
  }
}