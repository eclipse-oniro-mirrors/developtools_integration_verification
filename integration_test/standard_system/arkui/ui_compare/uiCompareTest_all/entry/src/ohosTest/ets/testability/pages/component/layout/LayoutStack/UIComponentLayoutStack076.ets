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
struct UIComponentLayoutStack076 {
  @State name: string = 'UIComponentLayoutStack076';
  @State alignContent: Alignment = Alignment.TopStart;
  myXComponentController: XComponentController = new XComponentController();
  @State stackMarginTop: number = 10;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {

      Button('获取Stack组件外边距')
        .id(this.name + '_001')
        .onClick(() => {
        })
      Text('上: ' + this.stackMarginTop.toString())
      Text('右: ' + this.stackMarginTop.toString())
      Text('下: ' + this.stackMarginTop.toString())
      Text('左: ' + this.stackMarginTop.toString())

      XComponent({
        id: this.name + '_002',
        type: XComponentType.NODE,
        libraryname: 'nativerender',
        controller: this.myXComponentController
      }) {
        Stack({ }) {
          Text('This is a Text component1').width('80%').height('60%').backgroundColor(0xd2cab3)
          Text('This is a Text component2').width('60%').height('40%').backgroundColor(0xd2cab3)
        }
        .margin(this.stackMarginTop)
        .id(this.name + '_003')
      }
      .width('100%')
      .height('100%')

    }
    .width('100%')
    .height('100%')
  }
}