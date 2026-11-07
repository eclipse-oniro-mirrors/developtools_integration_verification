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
import { drawing, common2D } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ImageReset15 {
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = [$r('app.media.icon'), ImageContent.EMPTY];
  @State info:string = 'loading~~';
  private color: common2D.Color = {
    alpha: 255,
    red: 255,
    green: 0,
    blue: 0
  };
  @State drawingColorFilterFirst: ColorFilter | undefined = undefined;

  build() {
    Column({ space: 10 }) {
      Text('image test reset')
        .height(40)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(10)

      Text(this.info)
        .height(30)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(6)

      Column(){
        Image(this.imageSrcList[this.imageSrcIndex])
          .width(104)
          .height(104)
          .margin(20)
          .padding(5)
          .colorFilter(this.drawingColorFilterFirst)
          .backgroundColor(Color.Pink)
          .onComplete((event)=>{
            if(event) {
              this.info = 'loading success'
            }
          })
      }
      .width('20.83%')
      .height('12.3%')
      .borderWidth(2)
      .backgroundColor('#fff')

      Button('set colorFilter')
        .id('imageReset15_01')
        .height(40)
        .fontSize(15)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick( () => {
          this.drawingColorFilterFirst =
            drawing.ColorFilter.createBlendModeColorFilter(this.color, drawing.BlendMode.SRC_IN);
        })

      Button('Empty')
        .id('imageReset15_02')
        .height(60)
        .fontSize(18)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick(() => {
          this.imageSrcIndex = 1
        })

      Button('传入图片')
        .id('imageReset15_03')
        .height(60)
        .fontSize(18)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .fontWeight(300)
        .margin(10)
        .onClick(() => {
          this.imageSrcIndex = 0
        })
    }.width('100%')
    .padding(20)
  }
}
