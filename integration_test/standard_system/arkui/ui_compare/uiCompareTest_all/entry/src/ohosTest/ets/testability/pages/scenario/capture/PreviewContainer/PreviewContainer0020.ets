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
struct PreviewContainer0020 {
  build() {
    Column({ space: 5 }) {
      // 设置子元素垂直方向间距为5
      Text('space').width('90%')
      Column({ space: 5 }) {
        Column().width('100%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('100%').height('2.46%').backgroundColor(0x00FFFF)
      }.width('90%').height('8.2%').border({ width: 1 })

      // 通过数值方式设置子元素垂直方向间距
      Text('Numeric space').width('90%')
      Column({ space: 10 }) {
        Column().width('100%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('100%').height('2.46%').backgroundColor(0x00FFFF)
      }.width('90%').height('8.2%').border({ width: 1 })

      // 设置子元素水平方向对齐方式
      Text('alignItems(Start)').width('90%')
      Column() {
        Column().width('50%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('50%').height('2.46%').backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.Start).width('90%').border({ width: 1 })

      Text('alignItems(Center)').width('90%')
      Column() {
        Column().width('50%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('50%').height('2.46%').backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.Center).width('90%').border({ width: 1 })

      Text('alignItems(End)').width('90%')
      Column() {
        Column().width('50%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('50%').height('2.46%').backgroundColor(0x00FFFF)
      }.alignItems(HorizontalAlign.End).width('90%').border({ width: 1 })

      // 设置子元素垂直方向的对齐方式
      Text('justifyContent(SpaceBetween)').width('90%')
      Column() {
        Column().width('90%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('90%').height('2.46%').backgroundColor(0x00FFFF)
      }.height('8.2%').border({ width: 1 }).justifyContent(FlexAlign.SpaceBetween)

      Text('justifyContent(SpaceAround)').width('90%')
      Column() {
        Column().width('90%').height('2.46%').backgroundColor(0xAFEEEE)
        Column().width('90%').height('2.46%').backgroundColor(0x00FFFF)
      }.height('8.2%').border({ width: 1 }).justifyContent(FlexAlign.SpaceAround)
    }.width('100%').padding({ top: 5 })
  }
}
