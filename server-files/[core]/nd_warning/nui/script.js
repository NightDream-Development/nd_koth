
const rawTextURL = "https://raw.githubusercontent.com/e";


async function fetchAndDisplayText() {
  try {
    const response = await fetch(rawTextURL);
    if (response.ok) {
      const text = await response.text();
      document.getElementById("textFromGitHub").textContent = text;
    } else {
      document.getElementById("textFromGitHub").textContent = "Ez a szerver korai alfában van, minden folyamatban lévő munka!";
    }
  } catch (error) {
    document.getElementById("textFromGitHub").textContent = "Ez a szerver korai alfában van, minden folyamatban lévő munka!";
  }
}


fetchAndDisplayText();
