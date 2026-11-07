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
struct ImageReset03 {
  @State imageSrcIndex: number = 0;
  @State imageSrcList: (ResourceStr | ImageContent)[] = [$r('app.media.icon'), ImageContent.EMPTY];
  @State info:string = 'loading~~';

  build() {
    Column({ space: 10 }) {
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
          .backgroundColor(Color.White)
          .borderImage({
            source: {
              angle: 90,
              direction: GradientDirection.Left,
              colors: [[0xAEE1E1, 0.0], [0xD3E0DC, 0.3], [0xFCD1D1, 1.0]]
            },
            slice: { top: 10, bottom: 10, left: 10, right: 10 },
            width: { top: '10px', bottom: '10px', left: '10px', right: '10px' },
            repeat: RepeatMode.Stretch,
            fill: false
          })
          .onComplete((event)=>{
            if(event) {
              this.info = 'loading success'
            }
          })
      }
      .width('20.83%')
      .height('12.3%')
      .backgroundColor(Color.Blue)
      Button('点击切换Image的src')
        .padding(20)
        .onClick(() => {
          this.imageSrcIndex = (this.imageSrcIndex + 1) % this.imageSrcList.length;
        })
    }.width('100%')
    .padding(20)
  }
}
