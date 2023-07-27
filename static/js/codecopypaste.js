/* adapated from https://aaronluna.dev/blog/add-copy-button-to-code-blocks-hugo-chroma/ */

function createCopyButton(highlightDiv) {
    const button = document.createElement("button");
    button.className = "copy-code-button";
    button.type = "button";
    button.innerHTML = '<i class="far fa-clipboard"></i>';
    button.addEventListener("click", () => copyCodeToClipboard(button, highlightDiv));
    addCopyButtonToDom(button, highlightDiv);
  }
  
  async function copyCodeToClipboard(button, highlightDiv) {
    const codeToCopy = highlightDiv.querySelector(":last-child > .chroma > code").innerText;
    try {
      result = await navigator.permissions.query({ name: "clipboard-write" });
      if (result.state == "granted" || result.state == "prompt") {
        await navigator.clipboard.writeText(codeToCopy);
      } else {
        copyCodeBlockExecCommand(codeToCopy, highlightDiv);
      }
    } catch (_) {
      copyCodeBlockExecCommand(codeToCopy, highlightDiv);
    }
    finally {
      codeWasCopied(button);
    }
  }
  
  function copyCodeBlockExecCommand(codeToCopy, highlightDiv) {
    const textArea = document.createElement("textArea");
    textArea.contentEditable = 'true'
    textArea.readOnly = 'false'
    textArea.className = "copyable-text-area";
    textArea.value = codeToCopy;
    highlightDiv.insertBefore(textArea, highlightDiv.firstChild);
    const range = document.createRange()
    range.selectNodeContents(textArea)
    const sel = window.getSelection()
    sel.removeAllRanges()
    sel.addRange(range)
    textArea.setSelectionRange(0, 999999)
    document.execCommand("copy");
    highlightDiv.removeChild(textArea);
  }
  
  function codeWasCopied(button) {
    button.blur();
    button.innerHTML = '<i class="far fa-check-circle"></i>';
    setTimeout(function() {
      button.innerHTML = '<i class="far fa-clipboard"></i>';
    }, 3000);
  }
  
  function addCopyButtonToDom(button, highlightDiv) {
    highlightDiv.insertBefore(button, highlightDiv.firstChild);
    const wrapper = document.createElement("div");
    wrapper.className = "highlight-wrapper";
    highlightDiv.parentNode.insertBefore(wrapper, highlightDiv);
    wrapper.appendChild(highlightDiv);
  }
  
  document.querySelectorAll(".highlight")
    .forEach(highlightDiv => createCopyButton(highlightDiv));