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
struct PreviewContainer0120 {
  build() {
    Column({ space: 5 }) {
      // Set the horizontal spacing between two adjacent child components to 5.
      Text('space').width('90%')
      Row({ space: 5 }) {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').height('8.77%').border({ width: 1 })

      // Set the spacing between child components using the Resource type.
      Text('Resource space').width('90%')
      Row({ space: $r('app.string.stringSpace') }) {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').height('8.77%').border({ width: 1 })

      // Set the alignment mode of the child components in the vertical direction.
      Text('alignItems(Center)').width('90%')
      Row() {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').alignItems(VerticalAlign.Center).height('15%').border({ width: 1 })

      Text('alignItems(Bottom)').width('90%')
      Row() {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').alignItems(VerticalAlign.Bottom).height('15%').border({ width: 1 })

      // Set the alignment mode of the child components in the horizontal direction.
      Text('justifyContent(End)').width('90%')
      Row() {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 }).justifyContent(FlexAlign.End)

      Text('justifyContent(Center)').width('90%')
      Row() {
        Row().width('30%').height('4.1%').backgroundColor(0xAFEEEE)
        Row().width('30%').height('4.1%').backgroundColor(0x00FFFF)
      }.width('90%').border({ width: 1 }).justifyContent(FlexAlign.Center)
    }.width('100%')
  }
}
