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

import Logger from './Logger';
import image from '@ohos.multimedia.image';
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common'
import { GlobalThis } from './globalThis'
import { screenshot } from '@kit.ArkUI';
import { BusinessError } from '@ohos.base'
import Settings from './Settings';

const TAG: string = '[TEST]';

class windowSnap {
  filePath(pageName ?: string) {
    let context: common.UIAbilityContext | undefined = GlobalThis.getInstance().getContext('context')
    Logger.info(TAG, 'deleteFile start');
    let pathDir:string = context ? context.filesDir : "/"
    Logger.info(TAG, `deleteFile pathDir = ${pathDir}`)
    let name = pageName ? pageName : "test"
    let displayName = `IMG_${name}.webp`
    let filePath: string = pathDir + "/" + displayName;
    Logger.info(TAG, 'createFile filePath = ${filePath}')
    return filePath;
  }

  async deleteFile(filePath: string) {
    let exists = await fs.access(filePath)
    Logger.info(TAG, `oldFile exists = ${exists}`)
    if (exists) {
      fs.unlinkSync(filePath)
      Logger.info(TAG, `remove file succeed`)
    }
  }

  createFile(filePath: string) {
    return fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
  }

  async save(filePath: string, data: image.PixelMap) {
    let packOpts: image.PackingOption = {
      format: "image/webp", quality: 100
    }
    let imagePackerApi = image.createImagePacker()
    let arrayBuffer = await imagePackerApi.packing(data, packOpts)
    let file: fs.File | null = null;
    while (file == null) {
      file = this.createFile(filePath)
    }
    let exists = await fs.access(file.path)
    Logger.info(TAG, `createFile exists = ${exists}`)
    let fd = file.fd
    Logger.info(TAG, `createFile fd = ${fd}`)
    imagePackerApi.release()
    try {
      await fs.write(fd, arrayBuffer)
    } catch (err) {
      Logger.error(TAG, `write failed  code is ${err.code},message is ${err.message}`)
    }
    fs.closeSync(file)
    Logger.info(TAG, `write picture done`)
  }

  /*
   * 获取窗口结合&文件保存
   * 入参必填 ability的context

   * snapShot
   * save：设备端保存路径：/data/app/el2/100/base/{bundle_name}/haps/entry_test/files/IMG_test.webp
   * 查看命令:hdc_st shell ,cd
   **/
  async snapShot(pageName?: string) {
    //获取窗口
    Logger.info(TAG, 'start snapshot')
    if (Settings.windowClass == undefined) {
      Logger.info(TAG, 'getWindowClass error')
      return;
    }
    Logger.info(TAG, 'find window success')
    Logger.info(TAG, 'find window success, snapShot pageName is: ',pageName)
    let filePath = this.filePath(pageName)
    this.deleteFile(filePath);

    //截屏
    Settings.windowClass.snapshot((err, data: image.PixelMap) => {
      if (err.code) {
        Logger.info('failed to snap window .cause : ' + JSON.stringify(err))
        return;
      }
      Logger.info(TAG, 'Succeed in saving screenshot. Pixel bytes number: ' + data.getPixelBytesNumber())
      this.save(filePath, data)

      data.release();
    });
  }

  /*
  * 获取窗口结合&文件保存
  * 入参必填 ability的context
  * screenShot
  * save：设备端保存路径：/data/app/el2/100/base/{bundle_name}/haps/entry_test/files/IMG_test.webp
  * 查看命令:hdc_st shell ,cd
  **/

  async screenShot(pageName?: string) {
    Logger.info(TAG, 'start screen shot')
    if (Settings.windowClass == undefined) {
      Logger.info(TAG, 'getWindowClass error')
      return;
    }
    Logger.info(TAG, 'find window success')
    let filePath = this.filePath(pageName)
    this.deleteFile(filePath)

    // 获取窗口属性
    try {
      let properties = Settings.windowClass.getWindowProperties();
      Logger.info(TAG, 'properties.windowRect =  ' + JSON.stringify(properties))

      let screenshotOptions: screenshot.ScreenshotOptions = {
        "screenRect": properties.windowRect,
        "imageSize": {
          "width": properties.windowRect.width,
          "height": properties.windowRect.height
        }
      };
      Logger.info(TAG, 'screenshotOptions: ' + JSON.stringify(screenshotOptions));
      try {
        screenshot.save(screenshotOptions, (err: BusinessError, pixelMap: image.PixelMap) => {
          if (err) {
            Logger.info('failed to save screenshot .Code : ' + JSON.stringify(err))
            return;
          }
          Logger.info(TAG, 'Succeed in saving screenshot. Pixel bytes number: ' + pixelMap.getPixelBytesNumber())
          this.save(filePath, pixelMap) //pixelMap 保存生成文件
          pixelMap.release();
        });
      } catch (exception) {
        Logger.error(TAG, 'failed to : save screenshot. code: ' + JSON.stringify(exception));
      }

    } catch (exception) {
      Logger.error(TAG, 'failed to obtain the window properties .Cause : ' + JSON.stringify(exception))
    }
  }
}

export default new windowSnap()