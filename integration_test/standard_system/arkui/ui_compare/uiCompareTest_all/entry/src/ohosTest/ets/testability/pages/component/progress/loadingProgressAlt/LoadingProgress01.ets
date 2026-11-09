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

import { UIContext } from '@kit.ArkUI';

class MyLoadingProgressStyle implements ContentModifier<LoadingProgressConfiguration> {
  public enableLoading: boolean = false;
  ctx: UIContext | undefined = undefined;

  constructor(enableLoading: boolean, ctx: UIContext) {
    this.enableLoading = enableLoading;
    this.ctx = ctx;
  }

  applyContent(): WrappedBuilder<[LoadingProgressConfiguration]> {
    return wrapBuilder(buildLoadingProgress);
  }
}

@Builder
function buildLoadingProgress(config: LoadingProgressConfiguration) {
  Column() {
    Row() {
      Column() {
        Gauge({
          value: (config.contentModifier as MyLoadingProgressStyle).enableLoading ? 50 : 30, min: 11, max: 100
        }) {
          Column() {
            Text('60')
              .maxFontSize('180sp')
              .minFontSize('160.0vp')
              .fontWeight(FontWeight.Medium)
              .fontColor('#ff182431')
              .width('40%')
              .height('30%')
              .textAlign(TextAlign.Center)
              .margin({ top: '22.2%' })
              .textOverflow({ overflow: TextOverflow.Ellipsis })
              .maxLines(1)
          }.width('100%').height('100%')
        }
        .colors(((config.contentModifier as MyLoadingProgressStyle).enableLoading) ? Color.Grey : 0x2577e3)
        .width(100)
        .strokeWidth(18)
        .padding(5)
        .trackShadow({ radius: 7, offsetX: 7, offsetY: 7 })
        .height(100)
      }.width('100%')
    }
  }.width('50%')
}


@Entry
@Component
struct LoadingProgress01 {
  @State loadingProgressList: (boolean | undefined | null)[] = [undefined, true, null, false];
  @State widthList: (number | string)[] = ['110%', 220, '40%', 80];
  @State loadingProgressIndex: number = 0;
  @State clickFlag: number = 0;
  @State testArg1:number | undefined | null = 1;
  @State testArg2:number | undefined | null = 0;
  @State testArg3:number | undefined | null = -1;
  @State testArg4:number | undefined | null = 100;
  @State testArg5:number | undefined | null = undefined;
  @State testArg6:number | undefined | null = null;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
        Column({ space: 5 }) {
          Text('LoadingProgress test color')
            .height(40)
            .fontSize(15)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
            .width('70%')
            .border({ width: 1 })
            .lineHeight(20)
            .fontWeight(300)
            .margin(10)
          Row() {
            Text('color: ' + this.testArg1)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg1)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)

          Row() {
            Text('color: ' + this.testArg2)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg2)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)

          Row() {
            Text('color: ' + this.testArg3)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg3)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)

          Row() {
            Text('color: ' + this.testArg4)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg4)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)

          Row() {
            Text('color: ' + this.testArg5)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg5)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)
          Row() {
            Text('color: ' + this.testArg6)
              .height(60)
              .fontSize(15)
              .textAlign(TextAlign.Center)
              .fontColor(Color.Black)
              .width('40%')
              .border({ width: 1 })
              .lineHeight(20)
              .fontWeight(300)
              .margin(10)
            LoadingProgress()
              .color(this.testArg6)
              .size({ width: '60%' })
              .contentModifier(new MyLoadingProgressStyle(false, this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)
        }.width('100%').margin({ top: 5 })
      }.height('100%')
    }
  }
}
