const repoURL = "https://api.github.com/repos/NightDream-Development/nd_koth/commits/main";

async function fetchAndDisplayCommitID() {
  try {
    const response = await fetch(repoURL);
    if (response.ok) {
      const commitData = await response.json();
      const latestCommitID = commitData.sha;
      document.getElementById("commitID").textContent = latestCommitID;
    } else {
      document.getElementById("commitID").textContent = "Failed to fetch commit ID.";
    }
  } catch (error) {
    document.getElementById("commitID").textContent = "Error occurred while fetching commit ID.";
  }
}

fetchAndDisplayCommitID();
