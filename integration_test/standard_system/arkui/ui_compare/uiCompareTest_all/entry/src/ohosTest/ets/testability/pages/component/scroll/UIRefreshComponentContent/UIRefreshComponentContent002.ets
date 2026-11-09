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
import { ComponentContent } from '@kit.ArkUI';

class Params {
  refreshStatus: RefreshStatus = RefreshStatus.Inactive
  constructor(refreshStatus: RefreshStatus) {
    this.refreshStatus = refreshStatus;
  }
}

@Builder
function customRefreshingContent(params: Params) {
  Stack() {
    Row() {
      LoadingProgress().height(32)
      Text('refreshStatus: ' + params.refreshStatus).fontSize(16).margin({ left: 20 })
    }
    .alignItems(VerticalAlign.Center)
  }
  .align(Alignment.Center)
  .clip(true)
  .constraintSize({ minHeight: 32 })
  .width('100%')
}

@Entry
@Component
struct UIRefreshComponentContent002 {
  @State isRefreshing1: boolean = false
  @State isRefreshing2: boolean = false
  @State arr: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
  @State refreshStatus1: RefreshStatus = RefreshStatus.Inactive
  @State refreshStatus2: RefreshStatus = RefreshStatus.Inactive
  private contentNode1?: ComponentContent<Object> = undefined
  private contentNode2?: ComponentContent<Object> = undefined
  private params: Params = new Params(RefreshStatus.Inactive)

  @Builder
  customRefreshComponent() {
    Stack() {
      Row() {
        LoadingProgress().height(32)
        Text('Refreshing...').fontSize(16).margin({ left: 20 })
      }
      .alignItems(VerticalAlign.Center)
    }
    .align(Alignment.Center)
    .clip(true)
    .constraintSize({ minHeight: 32 })
    .width('100%')
  }

  aboutToAppear(): void {
    let uiContext = this.getUIContext()
    this.contentNode1 = new ComponentContent(uiContext, wrapBuilder(customRefreshingContent), this.params)
    this.contentNode2 = new ComponentContent(uiContext, wrapBuilder(customRefreshingContent), this.params)
  }

  build() {
    Row() {
      Column() {
        Text('上拉测试')
          .fontSize(20)
          .fontColor(Color.Blue)
          .margin(10)
        Refresh({
          refreshing: $$this.isRefreshing1,
          refreshingContent: this.contentNode1,
          builder: this.customRefreshComponent()
        }) {
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('70%')
                  .height(80)
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .width('100%')
          .height('70%')
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.Off)
        }
        .id('Refresh1')
        .backgroundColor(0x89CFF0)
        .pullToRefresh(true)
        .refreshOffset(96)
        .onStateChange((refreshStatus: RefreshStatus) => {
          this.refreshStatus1 = refreshStatus
          this.params.refreshStatus = refreshStatus
          this.contentNode1?.update(this.params)
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.isRefreshing1 = false
          }, 2000)
          console.log('onRefreshing test')
        })
      }.width('50%')
      Column() {
        Text('下滑测试')
          .fontSize(20)
          .fontColor(Color.Blue)
          .margin(10)
        Refresh({
          refreshing: $$this.isRefreshing2,
          refreshingContent: this.contentNode2,
          builder: this.customRefreshComponent()
        }) {
          List() {
            ForEach(this.arr, (item: string) => {
              ListItem() {
                Text('' + item)
                  .width('70%')
                  .height(80)
                  .fontSize(16)
                  .margin(10)
                  .textAlign(TextAlign.Center)
                  .borderRadius(10)
                  .backgroundColor(0xFFFFFF)
              }
            }, (item: string) => item)
          }
          .onScrollIndex((first: number) => {
            console.info(first.toString())
          })
          .width('100%')
          .height('70%')
          .alignListItem(ListItemAlign.Center)
          .scrollBar(BarState.Off)
        }
        .id('Refresh2')
        .backgroundColor(0x89CFF0)
        .pullToRefresh(true)
        .refreshOffset(96)
        .onStateChange((refreshStatus: RefreshStatus) => {
          this.refreshStatus2 = refreshStatus
          this.params.refreshStatus = refreshStatus
          this.contentNode2?.update(this.params)
          console.info('Refresh onStatueChange state is ' + refreshStatus)
        })
        .onRefreshing(() => {
          setTimeout(() => {
            this.isRefreshing1 = false
          }, 2000)
          console.log('onRefreshing test')
        })
      }.width('50%')
    }
    .backgroundColor(0xDCDCDC)
    .width('100%')
    .height('100%')
  }
}