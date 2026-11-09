/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
@ComponentV2
export struct PinchgestureInterface0650 {
  @Local gestureInfo: string = '等待手势';
  @Local fingerListInfo: string = 'fingerList信息：无';
  @Local scaleValue: number = 1;
  @Local pinchValue: number = 1;

  build() {
    Column({ space: 10 }) {
      Text(`测试用例：SUB_ACE_ACTION_GESTURE_PINCHGESRURE_INTERFACE_0650`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Start)

      Divider()

      Text(`测试步骤：`)
        .fontSize(13)
        .fontColor(Color.Blue)
        .alignSelf(ItemAlign.Start)

      Text(`1. 进入图库选择图片进入大图浏览模式`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Text(`2. 一根手指放置在图片内，一根手指落在图片外，捏合`)
        .fontSize(12)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：正常响应捏合手势，且fingerList信息正确`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(this.gestureInfo)
        .fontSize(12)
        .fontColor(Color.Orange)
        .width('100%')

      Text(this.fingerListInfo)
        .fontSize(12)
        .fontColor(Color.Blue)
        .width('100%')

      Text(`当前缩放比例：${this.scaleValue.toFixed(2)}`)
        .fontSize(12)
        .fontColor(Color.Red)
        .width('100%')

      Divider()

      // 模拟图库大图
      Column() {
        Image($r('app.media.icon'))
          .width('80%')
          .height('80%')
          .objectFit(ImageFit.Contain)
          .scale({ x: this.scaleValue, y: this.scaleValue })
      }
      .width('100%')
      .height('32.79%')
      .backgroundColor('#E0E0E0')
      .justifyContent(FlexAlign.Center)
      .margin({ top: 10 })
      .gesture(
        PinchGesture({ fingers: 2, distance: 5 })
          .onActionStart((event) => {
            this.gestureInfo = `捏合手势开始`;
            const fingerCount = event.fingerList.length;
            let fingerInfo = `fingerList数量: ${fingerCount}\n`;
            event.fingerList.forEach((finger, index) => {
              fingerInfo += `手指${index + 1}: globalX=${finger.globalX.toFixed(0)}, globalY=${finger.globalY.toFixed(0)}\n`;
            });
            this.fingerListInfo = fingerInfo;
          })
          .onActionUpdate((event) => {
            this.scaleValue = this.pinchValue * event.scale;
            this.gestureInfo = `捏合中: scale=${event.scale.toFixed(2)}, pinchCenterX=${event.pinchCenterX.toFixed(0)}, pinchCenterY=${event.pinchCenterY.toFixed(0)}`;
          })
          .onActionEnd(() => {
            this.pinchValue = this.scaleValue;
            this.gestureInfo = '捏合手势结束';
            
            // 限制缩放范围
            if (this.scaleValue < 0.5) {
              this.scaleValue = 0.5;
              this.pinchValue = 0.5;
            } else if (this.scaleValue > 4) {
              this.scaleValue = 4;
              this.pinchValue = 4;
            }
          })
      )

      Text(`提示：使用两指进行捏合操作，观察fingerList信息`)
        .fontSize(11)
        .fontColor(Color.Gray)
        .width('100%')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor('#F5F5F5')
  }
}

