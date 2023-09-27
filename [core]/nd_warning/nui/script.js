
const rawTextURL = "https://raw.githubusercontent.com/evening-life/version/main/version.txt";


async function fetchAndDisplayText() {
  try {
    const response = await fetch(rawTextURL);
    if (response.ok) {
      const text = await response.text();
      document.getElementById("textFromGitHub").textContent = text;
    } else {
      document.getElementById("textFromGitHub").textContent = "This server is in Early Alpha everything is in Work In Progress!";
    }
  } catch (error) {
    document.getElementById("textFromGitHub").textContent = "This server is in Early Alpha everything is in Work In Progress!";
  }
}


fetchAndDisplayText();
