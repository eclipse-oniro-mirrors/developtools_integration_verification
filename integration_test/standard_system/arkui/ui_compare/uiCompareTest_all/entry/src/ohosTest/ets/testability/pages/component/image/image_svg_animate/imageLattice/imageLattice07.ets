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
import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ImageLattice07 {
  @State info1: string = 'loading~~';
  @State info2: string = 'loading~~';
  @State info3: string = 'loading~~';
  @State info4: string = 'loading~~';
  private xDivs: Array<number | undefined> = [undefined];
  private yDivs: Array<number | undefined> = [undefined];
  private fXCount: number = 3;
  private fYCount: number = 3;
  private drawingLatticeFirst: DrawingLattice =
    drawing.Lattice.createImageLattice(this.xDivs, this.yDivs, this.fXCount, this.fYCount);

  build() {
    Column() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {

        Text('image test resizable')
          .height(40)
          .fontSize(15)
          .textAlign(TextAlign.Center)
          .fontColor(Color.Black)
          .width('60%')
          .border({ width: 1 })
          .lineHeight(20)
          .fontWeight(300)
          .margin(10)

        Row(){
          Column(){
            Text('Original Image1')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info1)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image($r('app.media.icon'))
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .onComplete((event) => {
              if (event) {
                this.info1 = 'loading success'
              }
            })

        }.width('100%')
        .height('24%')

        Row(){
          Column(){
            Text('Resize by lattice image1')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info2)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image($r('app.media.icon'))
            .width(110)
            .height(110)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .resizable({
              lattice: this.drawingLatticeFirst
            })
            .onComplete((event) => {
              if (event) {
                this.info1 = 'loading success'
              }
            })

        }.width('100%')
        .height('24%')

        Row(){
          Column(){
            Text('Original Image2')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info3)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info3 = 'loading success'
              }
            })

        }.width('100%')
        .height('24%')

        Row(){
          Column(){
            Text('Resize by lattice image2')
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin({top:20,bottom:6})

            Text(this.info4)
              .height(40)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width(170)
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(6)
          }

          Image($r('app.media.ImageOrientation'))
            .width(110)
            .height(140)
            .margin(20)
            .padding(5)
            .objectFit(ImageFit.Contain)
            .backgroundColor(Color.White)
            .resizable({
              lattice: this.drawingLatticeFirst
            })
            .onComplete((event) => {
              if (event) {
                console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
                console.log('onComplete:event.contentWidth ' + event.contentWidth)
                console.log('onComplete:event.contentHeight ' + event.contentHeight)
                console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
                console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
                this.info4 = 'loading success'
              }
            })

        }.width('100%')
        .height('24%')
      }
    }.height('100%')
    .width('100%')
    .padding({ right: 10, top: 10 })
  }
}
