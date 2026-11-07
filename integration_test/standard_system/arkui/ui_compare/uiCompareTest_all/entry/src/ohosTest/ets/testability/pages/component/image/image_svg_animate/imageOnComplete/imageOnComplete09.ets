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

import { image } from '@kit.ImageKit'

@Entry
@Component
struct ImageOnComplete09 {
  @State value: number = 0;
  @State numberArr: number[] = [100, 200]
  @State imagePixelMap: image.PixelMap | undefined = undefined
  @State text:string = '';
  @State loadingStatus:number = 1;
  @State contentWidth:number = 1;
  @State contentHeight:number = 1;
  @State contentOffsetX:number = 1;
  @State contentOffsetY:number = 1;

  async aboutToAppear() {
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.icon'))
  }

  build() {
    Column() {
      Text(this.text)
        .height(40)
        .fontSize(15)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('70%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(300)
        .margin(10)

      Image(this.imagePixelMap)
        .width(this.numberArr[this.value])
        .height(this.numberArr[this.value])
        .margin({ bottom: 10 })
        .onComplete((event) => {
          if(event) {
            console.log('onComplete:event.loadingStatus ' + event.loadingStatus)
            console.log('onComplete:event.contentWidth ' + event.contentWidth)
            console.log('onComplete:event.contentHeight ' + event.contentHeight)
            console.log('onComplete:event.contentOffsetX ' + event.contentOffsetX)
            console.log('onComplete:event.contentOffsetY ' + event.contentOffsetY)
            this.loadingStatus = event.loadingStatus
            this.contentWidth = event.contentWidth
            this.contentHeight = event.contentHeight
            this.contentOffsetX = event.contentOffsetX
            this.contentOffsetY = event.contentOffsetY
            this.text = 'onComplete width:' + this.contentWidth + ' height:' + this.contentHeight + ' ' + this.value +' ' + this.loadingStatus
          }
        })

      Button(`change宽高`)
        .id('imageOnComplete09_01')
        .onClick(() => {
          this.value++;
          if (this.value > this.numberArr.length - 1) {
            this.value = 0
          }
        })

      Child({ children: $value }).margin(12)
    }.margin(50)
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }
}

@Component
struct Child {
  @Link children: number;

  // @Event $value: (val: number) => void = (val: number) => {};

  build() {
    Column() {
      Text(`${this.children}`)
      Button(`change 宽高 `)
        .id('imageOnComplete09_02')
        .onClick(() => {
          this.children++;
          if (this.children > 1) {
            this.children = 0
          }
          // this.$value(this.value);
        })
    }.border({ width: 5, color: Color.Pink }).margin({ top: 20 })
  }
}