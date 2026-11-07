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
struct UIComponentLayoutStack060 {
  @State name: string = 'UIComponentLayoutStack060';
  @State alignContent: Alignment = Alignment.TopStart;
  myXComponentController: XComponentController = new XComponentController();
  @State stackScaleX: number = 0;
  @State stackScaleY: number = 0;
  @State stackScaleZ: number = 0;
  @State stackScaleCenterX: number = 0;
  @State stackScaleCenterY: number = 0;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {

      Button('获取Stack组件缩放信息')
        .id(this.name + '_001')
        .onClick(() => {
          let context = this.getUIContext();
          let info = context.getComponentUtils().getRectangleById(this.name + '_003');
          this.stackScaleX = info.scale.x;
          this.stackScaleY = info.scale.y;
          this.stackScaleZ = info.scale.z;
          this.stackScaleCenterX = info.scale.centerX;
          this.stackScaleCenterY = info.scale.centerY;
        })
      Text('x轴缩放倍数: ' + this.stackScaleX.toString())
      Text('y轴缩放倍数: ' + this.stackScaleY.toString())
      Text('z轴缩放倍数: ' + this.stackScaleZ.toString())
      Text('变换中心点x轴坐标: ' + this.stackScaleCenterX.toString())
      Text('变换中心点y轴坐标: ' + this.stackScaleCenterY.toString())

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
        .scale({
          x: 0.5,
          y: 0.5,
          centerX: 0.5,
          centerY: 0.5
        })
        .id(this.name + '_003')
      }
      .width('100%')
      .height('100%')

    }
    .width('100%')
    .height('100%')
  }
}
