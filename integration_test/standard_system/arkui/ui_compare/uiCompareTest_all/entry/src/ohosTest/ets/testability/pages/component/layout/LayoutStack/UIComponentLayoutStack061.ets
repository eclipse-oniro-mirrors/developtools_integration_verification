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
struct UIComponentLayoutStack061 {
  @State name: string = 'UIComponentLayoutStack061';
  @State alignContent: Alignment = Alignment.TopStart;
  myXComponentController: XComponentController = new XComponentController();
  @State stackRotateX: number = 0;
  @State stackRotateY: number = 0;
  @State stackRotateZ: number = 0;
  @State stackRotateCenterX: number = 0;
  @State stackRotateCenterY: number = 0;
  @State stackRotateAngle: number = 0;

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Start }) {

      Button('获取Stack组件旋转信息')
        .id(this.name + '_001')
        .onClick(() => {
          let context = this.getUIContext();
          let info = context.getComponentUtils().getRectangleById(this.name + '_003');
          this.stackRotateX = info.rotate.x;
          this.stackRotateY = info.rotate.y;
          this.stackRotateZ = info.rotate.z;
          this.stackRotateCenterX = info.rotate.centerX;
          this.stackRotateCenterY = info.rotate.centerY;
          this.stackRotateAngle = info.rotate.angle;
        })
      Text('旋转轴向量x坐标: ' + this.stackRotateX.toString())
      Text('旋转轴向量y坐标: ' + this.stackRotateY.toString())
      Text('旋转轴向量z坐标: ' + this.stackRotateZ.toString())
      Text('变换中心点x轴坐标: ' + this.stackRotateCenterX.toString())
      Text('变换中心点y轴坐标: ' + this.stackRotateCenterY.toString())
      Text('旋转角度: ' + this.stackRotateAngle.toString())


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
        .rotate({
          x: 0.5,
          y: 0.5,
          z: 0.0,
          centerX: 0,
          centerY: 0,
          centerZ: 1,
          angle: 300,
          perspective: 0
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
