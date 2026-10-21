/**
 * Copyright (c) 2026 Ivan Iraci <ivan.iraci@professioneit.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
// ============================================================================
// Error Types
// ============================================================================
export var LSPErrorCode;
(function (LSPErrorCode) {
    // Server lifecycle errors
    LSPErrorCode["SERVER_NOT_FOUND"] = "SERVER_NOT_FOUND";
    LSPErrorCode["SERVER_START_FAILED"] = "SERVER_START_FAILED";
    LSPErrorCode["SERVER_CRASHED"] = "SERVER_CRASHED";
    LSPErrorCode["SERVER_TIMEOUT"] = "SERVER_TIMEOUT";
    LSPErrorCode["SERVER_NOT_READY"] = "SERVER_NOT_READY";
    // Request errors
    LSPErrorCode["FILE_NOT_FOUND"] = "FILE_NOT_FOUND";
    LSPErrorCode["FILE_NOT_READABLE"] = "FILE_NOT_READABLE";
    LSPErrorCode["INVALID_POSITION"] = "INVALID_POSITION";
    LSPErrorCode["UNSUPPORTED_LANGUAGE"] = "UNSUPPORTED_LANGUAGE";
    LSPErrorCode["CAPABILITY_NOT_SUPPORTED"] = "CAPABILITY_NOT_SUPPORTED";
    LSPErrorCode["RENAME_NOT_ALLOWED"] = "RENAME_NOT_ALLOWED";
    // Protocol errors
    LSPErrorCode["INVALID_RESPONSE"] = "INVALID_RESPONSE";
    LSPErrorCode["REQUEST_CANCELLED"] = "REQUEST_CANCELLED";
})(LSPErrorCode || (LSPErrorCode = {}));
export class LSPError extends Error {
    code;
    suggestion;
    details;
    constructor(code, message, suggestion, details) {
        super(message);
        this.code = code;
        this.suggestion = suggestion;
        this.details = details;
        this.name = 'LSPError';
    }
    toJSON() {
        return {
            error: {
                code: this.code,
                message: this.message,
                suggestion: this.suggestion,
                details: this.details,
            },
        };
    }
}
//# sourceMappingURL=types.js.map