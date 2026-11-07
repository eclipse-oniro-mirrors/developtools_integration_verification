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

class MyLoadingProgressStyle11 implements ContentModifier<LoadingProgressConfiguration> {
  public enableLoading: boolean = true;
  ctx: UIContext | undefined = undefined;

  constructor(enableLoading: boolean, ctx: UIContext) {
    this.enableLoading = enableLoading;
    this.ctx = ctx;
  }

  applyContent(): WrappedBuilder<[LoadingProgressConfiguration]> {
    return wrapBuilder(buildLoadingProgress11);
  }
}

let arr1: string[] =
  ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19'];
let arr2: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

@Builder
function buildLoadingProgress11(config: LoadingProgressConfiguration) {
  Column({ space: 8 }) {
    Row() {
      Column() {
        Circle({
          width: ((config.contentModifier as MyLoadingProgressStyle11).enableLoading) ? 100 : 80,
          height: ((config.contentModifier as MyLoadingProgressStyle11).enableLoading) ? 100 : 80
        })
          .fill(((config.contentModifier as MyLoadingProgressStyle11).enableLoading) ? Color.Grey : 0x2577e3)
      }.width('50%')

      Column() {
        Button('' + ((config.contentModifier as MyLoadingProgressStyle11).enableLoading))
          .onClick((event: ClickEvent) => {
            let uiContext = (config.contentModifier as MyLoadingProgressStyle11).ctx;
            if (uiContext) {
              uiContext.getPromptAction().showToast({
                message: ((config.contentModifier as MyLoadingProgressStyle11).enableLoading) + ''
              });
            }
          })
          .fontColor(Color.White)
          .backgroundColor(((config.contentModifier as MyLoadingProgressStyle11).enableLoading) ? Color.Grey : 0x2577e3)
          .margin(20)
        Button({ type: ButtonType.Normal, stateEffect: true }) {
          Row() {
            LoadingProgress().width(20).height(20).margin({ left: 12 }).color(0xFFFFFF)
            Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
          }.alignItems(VerticalAlign.Center)
        }.borderRadius(8).backgroundColor(0x317aff).width(90).height(40)
      }.width('50%')

    }

    Row() {
      Column() {
        Gauge({
          value: (config.contentModifier as MyLoadingProgressStyle11).enableLoading ? 50 : 30, min: 11, max: 100
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
        .colors(((config.contentModifier as MyLoadingProgressStyle11).enableLoading) ? Color.Grey : 0x2577e3)
        .width(200)
        .strokeWidth(18)
        .padding(5)
        .trackShadow({ radius: 7, offsetX: 7, offsetY: 7 })
        .height(200)
      }.width('100%')

    }

    Column() {
      List({ space: 20, initialIndex: 0 }) {
        ForEach(arr2, (item: string) => {
          ListItem() {
            Text((config.contentModifier as MyLoadingProgressStyle11).enableLoading ? '' + item : Number(item) * 2 + '')
              .width('100%')
              .height('100%')
              .fontColor((config.contentModifier as MyLoadingProgressStyle11).enableLoading ? Color.White : Color.Orange)
              .fontSize((config.contentModifier as MyLoadingProgressStyle11).enableLoading ? 16 : 20)
              .textAlign(TextAlign.Center)
              .backgroundColor((config.contentModifier as MyLoadingProgressStyle11).enableLoading ? Color.Grey : 0x2577e3)
          }
          .height('9.02%')
          .border({
            width: 2,
            color: Color.White
          })
        }, (item: string) => item)
      }
      .height('16.39%')
      .width('100%')
      .friction(0.6)

      .lanes({
        minLength: (config.contentModifier as MyLoadingProgressStyle11).enableLoading ? 40 : 80,
        maxLength: (config.contentModifier as MyLoadingProgressStyle11).enableLoading ? 40 : 80
      })
      .scrollBar(BarState.Off)
    }

  }.width('100%').padding(10)
}


@Entry
@Component
struct Builder0090 {
  @State loadingProgressList: (boolean | undefined | null)[] = [undefined, true, null, false];
  @State widthList: (number | string)[] = ['110%', 220, '40%', 80];
  @State loadingProgressIndex: number = 0;
  @State clickFlag: number = 0;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      Scroll(this.scroller) {
        Column({ space: 5 }) {
          Column() {
            LoadingProgress()
              .color('#106836')
              .size({ width: '100%' })
              .contentModifier(new MyLoadingProgressStyle11(this.loadingProgressList[this.loadingProgressIndex], this.getUIContext()))
          }.width('100%').backgroundColor(0xdcdcdc)
        }.width('100%').margin({ top: 5 })
      }.height('85%')

      Button('点击切换config.enableloading')
        .id('Builder0090_001')
        .onClick(() => {
        this.clickFlag++;
        this.loadingProgressIndex = (this.loadingProgressIndex + 1) % this.loadingProgressList.length;
        console.log('enableLoading:' + this.loadingProgressList[this.loadingProgressIndex]);
      }).margin(20)
    }

  }
}



